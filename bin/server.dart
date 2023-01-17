import 'package:musicos_online_back/api/login_api.dart';
import 'package:musicos_online_back/api/user_api.dart';
import 'package:musicos_online_back/infra/custom_server.dart';
import 'package:musicos_online_back/infra/middleware_interception.dart';
import 'package:musicos_online_back/infra/security/security_service.dart';
import 'package:musicos_online_back/service/user_service.dart';
import 'package:shelf/shelf.dart';

void main(List<String> args) async {
  var cascadeHandler = Cascade()
      .add(LoginApi(SecurityService()).getHandler())
      .add(UserApi(UserService()).getHandler(middlewares: [
        SecurityService().authorization,
        SecurityService().verifyJWT
      ]))
      .handler;

  var pipeline = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(MiddlewareInterception().middleware)
      .addHandler(cascadeHandler);
  await CustomServer().initialize(pipeline);
}
