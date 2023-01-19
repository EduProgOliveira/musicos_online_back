import 'package:musicos_online_back/infra/database/i_db_configuration.dart';
import 'package:mysql1/mysql1.dart';

class MysqlDbConfiguration implements IDbConfiguration {
  static MySqlConnection? _instance;

  MysqlDbConfiguration() {
    _createConnection();
  }

  _createConnection() async {
    return _instance = await MySqlConnection.connect(ConnectionSettings(
      host: 'localhost',
      port: 3306,
      db: 'musicos_online',
      user: 'root',
      password: 'dev123',
    ));
  }

  @override
  Future get connection async => _instance ?? await _createConnection();
}
