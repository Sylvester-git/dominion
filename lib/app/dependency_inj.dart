import 'package:dominion/features/cubit/get_sensor_data_cubit.dart';
import 'package:dominion/network/db_ds.dart';
import 'package:dominion/network/db_repo.dart';
import 'package:dominion/utils/storage.dart';
import 'package:get_it/get_it.dart';

final instance = GetIt.instance;

Future<void> init() async {
  instance.registerLazySingleton<Storage>(() => StorageImpl());
  // Registering the DatabaseDatasource
  instance.registerLazySingleton<DatabaseDatasource>(
    () => DatabaseDataSourceImpl(storage: instance()),
  );

  // Registering the DatabaseRepository
  instance.registerLazySingleton<DatabaseRepository>(
    () => DatabaseRepositoryImpl(
      databaseDatasource: instance<DatabaseDatasource>(),
    ),
  );

  // Registering the GetSensorDataCubit
  instance.registerLazySingleton<GetSensorDataCubit>(
    () => GetSensorDataCubit(
      databaserepo: instance<DatabaseRepository>(),
      instance(),
    ),
  );
}
