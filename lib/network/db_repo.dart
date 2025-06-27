import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dominion/model/health_data.dart';
import 'package:dominion/network/db_ds.dart';
import 'package:dominion/network/fail.dart';
import 'package:dominion/utils/mapper.dart';

abstract class DatabaseRepository {
  Future<Either<Failure, List<HealthDataModel>>> getSensorData({
    required String uid,
  });
}

class DatabaseRepositoryImpl implements DatabaseRepository {
  final DatabaseDatasource databaseDatasource;

  DatabaseRepositoryImpl({required this.databaseDatasource});

  @override
  Future<Either<Failure, List<HealthDataModel>>> getSensorData({
    required String uid,
  }) async {
    try {
      final result = await databaseDatasource.getSensorData(uid: uid);
      return right(result.map((e) => e.converttohealthdatamodel()).toList());
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      return left(Failure(message: e.toString(), code: 500));
    }
  }
}
