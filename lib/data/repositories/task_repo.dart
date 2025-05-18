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
}
