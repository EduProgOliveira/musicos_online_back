import 'dart:convert';
import 'package:musicos_online_back/api/api.dart';
import 'package:musicos_online_back/models/user_model.dart';
import 'package:musicos_online_back/service/i_generic_service.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class UserApi extends Api {
  final IGenericService<UserModel> _service;

  UserApi(this._service);

  @override
  Handler getHandler({List<Middleware>? middlewares, bool isSecurity = false}) {
    Router router = Router();

    router.post('/user', (Request request) async {
      var body = await request.readAsString();
      if (body.isEmpty) return Response(400);
      var result =
          await _service.create(UserModel.fromRequest(jsonDecode(body)));
      return result ? Response(201) : Response(500);
    });

    router.get('/user', (Request request) async {
      if (request.requestedUri.queryParameters['id'] == null) {
        return Response(400);
      }

      int id = int.parse(request.requestedUri.queryParameters['id']!);

      var result = await _service.findOne(id);

      return result != null
          ? Response(200, body: result.toJson())
          : Response(500);
    });

    router.put('/user', (Request request) {
      return Response.ok('User Update');
    });

    return createHandler(
        router: router, middlewares: middlewares, isSecurity: isSecurity);
  }
}
