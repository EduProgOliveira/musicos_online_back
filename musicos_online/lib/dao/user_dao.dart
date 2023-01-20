import 'package:musicos_online_back/dao/i_dao.dart';
import 'package:musicos_online_back/infra/database/i_db_configuration.dart';
import 'package:musicos_online_back/models/user_model.dart';

class UserDao implements IDao<UserModel> {
  final IDbConfiguration _dbConfiguration;

  UserDao(this._dbConfiguration);
  @override
  Future create(value) async {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future delete(int id) async {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<UserModel> findOne(int id) async {
    var connection = await _dbConfiguration.connection;
    final String query = 'select * from user_system where user_id = ?';
    var result = await connection.query(query, [id]);
    return UserModel.fromMap(result.first.fields);
  }

  @override
  Future update(value) async {
    // TODO: implement update
    throw UnimplementedError();
  }
}
