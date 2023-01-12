import 'package:musicos_online_back/models/user_model.dart';
import 'package:musicos_online_back/service/i_generic_service.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class UserApi {
  final IGenericService<UserModel> _service;

  UserApi(this._service);

  Handler get handler {
    Router router = Router();
    router.post('/user/create', (Request request) async {
      UserModel user = await _service.save(UserModel(
        id: 1,
        userLogin: 'userLogin',
        userPassword: 'userPassword',
        dateCreated: 'dateCreated',
        dateUpdated: 'dateUpdated',
      ));
      return Response.ok('User Create');
    });

    router.post('/user/update', (Request request) {
      return Response.ok('User Update');
    });

    return router;
  }
}
