import 'package:dominion/features/cubit/get_sensor_data_cubit.dart';
import 'package:dominion/network/db_ds.dart';
import 'package:dominion/network/db_repo.dart';
import 'package:get_it/get_it.dart';

final instance = GetIt.instance;

Future<void> init() async {
  // Registering the DatabaseDatasource
  instance.registerLazySingleton<DatabaseDatasource>(
    () => DatabaseDataSourceImpl(),
  );

  // Registering the DatabaseRepository
  instance.registerLazySingleton<DatabaseRepository>(
    () => DatabaseRepositoryImpl(
      databaseDatasource: instance<DatabaseDatasource>(),
    ),
  );

  // Registering the GetSensorDataCubit
  instance.registerFactory<GetSensorDataCubit>(
    () => GetSensorDataCubit(databaserepo: instance<DatabaseRepository>()),
  );
}
