import 'package:musicos_online_back/infra/database/i_db_configuration.dart';
import 'package:mysql1/mysql1.dart';

class MysqlDbConfiguration implements IDbConfiguration {
  MySqlConnection? _connection;

  @override
  Future<MySqlConnection> createConnection() async {
    return await MySqlConnection.connect(ConnectionSettings(
      host: 'localhost',
      port: 3306,
      db: 'musicos_online',
      user: 'root',
      password: 'dev123',
    ));
  }

  @override
  Future<MySqlConnection> get connection async {
    _connection ??= await createConnection();
    return _connection!;
  }
}
