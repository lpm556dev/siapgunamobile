import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ssg_app/models/Task.dart';
import 'package:ssg_app/utils/api_endpoint.dart';
import 'package:http/http.dart' as http;

class TaskRepository {
  static Future<SharedPreferences> prefsInit = SharedPreferences.getInstance();

  Future<MutabaahYaumiyahModel> getTask(int userId) async {
    try {
      final prefs = await prefsInit;
      final request = await http.get(
        Uri.parse(ApiEndpoint.currentMy(userId.toString())),
        headers: {
          'Authorization': 'Bearer ${prefs.getString('token') ?? ''}',
        },
      );

      final response = jsonDecode(request.body);

      if (request.statusCode == 200) {
        final task = MutabaahYaumiyahModel.fromJson(response['data']);
        return task;
      } else {
        throw Exception('Failed to load task : ${response['message']}');
      }
    } catch (e) {
      throw Exception('Failed to load task: $e');
    }
  }

  Future<MutabaahYaumiyahModel> getTaskById(int id) async {
    try {
      final prefs = await prefsInit;
      final request = await http.get(
        Uri.parse(ApiEndpoint.currentMy(id.toString())),
        headers: {
          'Authorization': 'Bearer ${prefs.getString('token') ?? ''}',
        },
      );

      final response = jsonDecode(request.body);

      if (request.statusCode == 200) {
        final task = MutabaahYaumiyahModel.fromJson(response['data']);
        return task;
      } else {
        throw Exception('Failed to load task : ${response['message']}');
      }
    } catch (e) {
      throw Exception('Failed to load task: $e');
    }
  }

  static Future<bool> getCurrent(userId,DateTime date) async {
    try {
      print("date current: ${date.year}-${date.month}-${date.day}");
      final response = http.Request('GET', Uri.parse(ApiEndpoint.currentMy(userId.toString())))
        ..headers['Content-Type'] = 'application/json'
        ..body = jsonEncode({'date': "${date.year}-${date.month}-${date.day}"});

      final streamedResponse = await response.send();
      final result = await http.Response.fromStream(streamedResponse);
      print('Response status: ${result.statusCode}');
      if(result.statusCode != 200) {
        throw Exception('Failed to fetch data: ${result.body}');
      }
      print('Response body: ${result.body}');
      return true;
    } catch (e) {
      print('Error fetching current task: $e');
      return false;
    }
  }
}
