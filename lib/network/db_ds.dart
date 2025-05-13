abstract class DatabaseDatasource {
  Future<void> getSensorData();
}

class DatabaseDataSourceImpl implements DatabaseDatasource {
  @override
  Future<void> getSensorData() async {}
}
