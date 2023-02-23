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
      var params = {
        'user_id': user.userId,
        'user_name': user.userName,
        'user_email': user.userEmail,
        'user_username': user.userUserName,
        'user_gender': user.userGender,
        'user_biography': user.userBiography,
        'user_state': user.userState,
        'user_city': user.userCity,
        'user_lat': user.userLat,
        'user_long': user.userLong,
        'user_active': user.userActive,
        'user_premium': user.userPremium,
        'music_default_type_id': user.musicDefaultTypeId,
        'music_default_title': user.musicDefaultTypeTitle,
        'musician_default_type_id': user.musicianDefaultTypeId,
        'musician_default_type_title': user.musicianDefaultTypeTitle,
        'instrument_default_type_id': user.instrumentDefaultTypeId,
        'instrument_default_type_title': user.instrumentDefaultTypeTitle,
      };

      params.removeWhere((key, value) => value == null);

      return await _userDao.update(params);
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
