import 'package:musicos_online_back/dao/i_dao.dart';
import 'package:musicos_online_back/models/user_model.dart';
import 'package:musicos_online_back/service/i_generic_service.dart';

class UserService implements IGenericService<UserModel> {
  final IDao _userDao;

  UserService(this._userDao);
  @override
  Future<UserModel?> findOne(int id) async {
    var result = await _userDao.findOne(id);
    return result;
  }

  @override
  Future<bool> create(UserModel user) async {
    if (user.userId != null) {
      return await _userDao.update(user);
    }
    return await _userDao.create(user);
  }

  @override
  Future<bool> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> findAll() {
    // TODO: implement findAll
    throw UnimplementedError();
  }
}
