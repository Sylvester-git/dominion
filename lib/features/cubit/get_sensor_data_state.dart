part of 'get_sensor_data_cubit.dart';

abstract class GetSensorDataState extends Equatable {
  const GetSensorDataState();

  @override
  List<Object> get props => [];
}

class GetSensorDataInitial extends GetSensorDataState {}

class GetSensorDataLoading extends GetSensorDataState {}

class GetSensorDataLoaded extends GetSensorDataState {
  final List<HealthDataModel> healthData;

  const GetSensorDataLoaded({required this.healthData});

  @override
  List<Object> get props => [healthData];
}

class GetSensorDataError extends GetSensorDataState {
  final Failure failure;

  const GetSensorDataError({required this.failure});

  @override
  List<Object> get props => [failure];
}

