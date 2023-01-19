import 'package:musicos_online_back/models/user_model.dart';
import 'package:musicos_online_back/service/i_generic_service.dart';

class UserService implements IGenericService<UserModel> {
  List<UserModel> _fakeDB = [];
  @override
  Future<UserModel> findOne(int id) async {
    return _fakeDB.firstWhere((element) => element.id == id);
  }

  @override
  Future<List<UserModel>> findAll() async {
    return _fakeDB;
  }

  @override
  Future<UserModel> save(UserModel user) async {
    return _fakeDB.firstWhere(
      (element) => element.id == user.id,
      orElse: () {
        _fakeDB.add(user);
        return user;
      },
    );
  }

  @override
  Future<bool> delete(int id) async {
    _fakeDB.removeWhere((element) => element.id == id);
    return true;
  }
}
