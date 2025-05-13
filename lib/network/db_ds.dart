import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dominion/network/api.dart';

abstract class DatabaseDatasource {
  Future<List<Map<String, dynamic>>> getSensorData();
}

class DatabaseDataSourceImpl implements DatabaseDatasource {
  final Api api = Api();
  @override
  Future<List<Map<String, dynamic>>> getSensorData() async {
    try {
      final dio = await api.getDio();
      final response = await dio.get('/health-data/NFC123456');
      if (response.statusCode == 200) {
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
