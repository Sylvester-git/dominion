import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dominion/network/api.dart';
import 'package:dominion/utils/storage.dart';

abstract class DatabaseDatasource {
  Future<List<Map<String, dynamic>>> getSensorData({required String uid});
}

class DatabaseDataSourceImpl implements DatabaseDatasource {
  final Api api = Api();
  final Storage _storage;

  DatabaseDataSourceImpl({required Storage storage}) : _storage = storage;
  @override
  Future<List<Map<String, dynamic>>> getSensorData({
    required String uid,
  }) async {
    try {
      final dio = await api.getDio();
      final response = await dio.get('/health-data/$uid');
      if (response.statusCode == 200) {
        await _storage.saveUserID(userID: uid);
        return List<Map<String, dynamic>>.from(response.data['health_data']);
      } else {
        throw Exception('Failed to load sensor data');
      }
    } on DioException catch (e, s) {
      log("StackTrace: $s");
      rethrow;
    }
  }
}
