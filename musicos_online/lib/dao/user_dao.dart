import 'package:musicos_online_back/dao/i_dao.dart';
import 'package:musicos_online_back/infra/database/i_db_configuration.dart';
import 'package:musicos_online_back/models/user_model.dart';

class UserDao implements IDao<UserModel> {
  final IDbConfiguration _dbConfiguration;

  UserDao(this._dbConfiguration);
  @override
  Future<bool> create(UserModel value) async {
    var result = await _query(
      query:
          'insert into user_system (user_name,user_email,user_password) values (?,?,?)',
      params: [value.userName, value.userEmail, value.userPassword],
    );
    return result.affectedRows > 0;
  }

  @override
  Future<bool> delete(int id) async {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<UserModel?> findOne(int id) async {
    var result = await _query(
        query: 'select * from user_system where user_id = ?', params: [id]);

    return result.isEmpty ? null : UserModel.fromMap(result.first.fields);
  }

  @override
  Future<bool> update(Map<String, dynamic> params) async {
    final data = params.values.toList().reversed.toList();
    params.removeWhere((key, value) => key == 'user_id');
    final columns = params.keys.map((key) => '$key=?').toList();

    var result = await _query(
        query: 'update user_system set ${columns.join(',')} where user_id = ?',
        params: data);
    return result.affectedRows > 0;
  }

  _query({required String query, List? params}) async {
    var connection = await _dbConfiguration.connection;
    return await connection.query(query, params);
  }
}
