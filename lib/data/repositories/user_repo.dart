import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:ssg_app/models/User.dart';
import 'dart:convert';
import 'package:ssg_app/utils/api_endpoint.dart';

class UserRepository {
  static Future<SharedPreferences> prefsInit = SharedPreferences.getInstance();

  Future<void> setUserSession(String userName, int idUser, String role) async {
    final prefs = await prefsInit;
    await prefs.setString('username', userName);
    await prefs.setInt('userId', idUser);
    await prefs.setString('role', role);
  }

  static Future<String> getString(String key) async {
    final prefs = await prefsInit;
    final String? value = prefs.getString(key);
    return value ?? '';
  }

  static Future<int> getInteger(String key) async {
    final prefs = await prefsInit;
    final int? value = prefs.getInt(key);
    return value ?? 0;
  }

  static Future<dynamic> setSession(String key, dynamic value) async {
    final prefs = await prefsInit;
    if (value is String) {
      return prefs.setString(key, value);
    } else if (value is int) {
      return prefs.setInt(key, value);
    } else if (value is bool) {
      return prefs.setBool(key, value);
    } else if (value is double) {
      return prefs.setDouble(key, value);
    }
  }

  Future<Map<String, dynamic>> login(
    String phoneNumber,
    String password,
  ) async {
    try {
      final response = await http.post(
        Uri.parse(ApiEndpoint.login),
        body: {"nomor_hp": phoneNumber, "password": password},
      );

      final Map<String, dynamic> responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (responseData['user_verify']['isverified'] > 0) {
          setUserSession(
            responseData['data']['nama_lengkap'],
            int.parse(responseData['data']['id'].toString()),
            responseData['userRole']['role'],
          );
        }
        return responseData;
      } else {
        throw Exception(responseData['message'] ?? 'Login failed');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  Future<Map<String, dynamic>> register(UserModel userData) async {
    try {
      final response = await http.post(
        Uri.parse(ApiEndpoint.registrasi),
        body: userData.toJson(),
      );

      final Map<String, dynamic> responseData = jsonDecode(response.body);

      if (response.statusCode == 201) {
        return responseData;
      } else {
        throw Exception(responseData['message'] ?? 'Registration failed');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  static Future<Map<String, dynamic>> getQrCode() async {
    try {
      final userId = await getInteger("userId");
      final response = await http.get(
        Uri.parse(ApiEndpoint.qrCode(userId.toString())),
      );

      final Map<String, dynamic> responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return responseData;
      } else {
        throw Exception(responseData['message'] ?? 'QR Code retrieval failed');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  Future<dynamic> sendOtp(int userId, String otp) async {
    try {
      final response = await http.post(
        Uri.parse(ApiEndpoint.otpVerify),
        body: {"userId": userId.toString(), "otp": otp},
      );

      final Map<String, dynamic> responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception(responseData['message'] ?? 'OTP verification failed');
      }
    } catch (e) {
      String errorMessage = e.toString();
      errorMessage = errorMessage.replaceAll(
        'Exception: Network error: Exception: ',
        '',
      );
      errorMessage = errorMessage.replaceAll('Exception: ', '');
      return Future.value(errorMessage);
    }
  }

  Future<dynamic> loginAfterOtpVerify(
    String phoneNumber,
    String password,
    int userId,
    String otp,
  ) async {
    try {
      final otpResponse = await sendOtp(userId, otp);
      if (otpResponse == true) {
        final loginResponse = await login(phoneNumber, password);
        if (loginResponse['data'] != null) {
          return Future.value(true);
        } else {
          throw Exception('Login failed');
        }
      } else {
        throw Exception(otpResponse);
      }
    } catch (e) {
      String errorMessage = e.toString();
      errorMessage = errorMessage.replaceAll(
        'Exception: Network error: Exception: ',
        '',
      );
      errorMessage = errorMessage.replaceAll('Exception: ', '');
      return Future.value(errorMessage);
    }
  }

  Future<void> logout(Function goTo) async {
    final prefs = await prefsInit;
    await prefs.clear();
    return goTo();
  }
}
