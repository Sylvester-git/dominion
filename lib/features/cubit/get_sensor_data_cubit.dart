import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dominion/model/health_data.dart';
import 'package:dominion/network/db_repo.dart';
import 'package:dominion/network/fail.dart';
import 'package:dominion/utils/storage.dart';
import 'package:equatable/equatable.dart';

part 'get_sensor_data_state.dart';

class GetSensorDataCubit extends Cubit<GetSensorDataState> {
  final DatabaseRepository _databaserepo;
  final Storage _storage;
  GetSensorDataCubit(this._storage, {required DatabaseRepository databaserepo})
    : _databaserepo = databaserepo,
      super(GetSensorDataInitial());

  Future<void> getSensorData({required String uid}) async {
    emit(GetSensorDataLoading());
    final result = await _databaserepo.getSensorData(uid: uid);
    result.fold(
      (failure) => emit(GetSensorDataError(failure: failure)),
      (data) => emit(GetSensorDataLoaded(healthData: data)),
    );
  }

  Future<void> refreshSensorData() async {
    final uid = await _storage.getUserID();
    final result = await _databaserepo.getSensorData(uid: uid);
    result.fold((failure) {
      log("Error: ${failure.message}");
    }, (data) => emit(GetSensorDataLoaded(healthData: data)));
  }
}
