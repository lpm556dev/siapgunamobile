import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiEndpoint {
  static final String baseUrl = dotenv.env['BASE_API_URL'] ?? '';

  static String registrasi = "$baseUrl/api/users/register";
  static String login = "$baseUrl/api/users/login";
  static String otpVerify = '$baseUrl/api/users/verify';
  static String inputMy = '$baseUrl/api/users/input-my';

  static String currentMy(String userId) {
    return '$baseUrl/api/users/get-ibadah-date?user_id=$userId';
  }

  static String monthlyMy(String userId) {
    return '$baseUrl/api/users/get-ibadah-month?user_id=$userId';
  }

  static String qrCode(String userId) {
    return '$baseUrl/api/users/user-qrcode?user_id=$userId';
  }
}
