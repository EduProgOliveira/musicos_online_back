import 'package:musicos_online_back/api/login_api.dart';
import 'package:musicos_online_back/api/user_api.dart';
import 'package:musicos_online_back/infra/custom_server.dart';
import 'package:musicos_online_back/infra/dependency_injector/dependency_injector.dart';
import 'package:musicos_online_back/infra/dependency_injector/injector.dart';
import 'package:musicos_online_back/infra/middleware_interception.dart';
import 'package:musicos_online_back/infra/security/security_service.dart';
import 'package:musicos_online_back/service/user_service.dart';
import 'package:shelf/shelf.dart';

void main(List<String> args) async {
  var dep = Injector.initialize();

  var cascadeHandler = Cascade()
      .add(dep.get<LoginApi>().getHandler())
      .add(dep.get<UserApi>().getHandler(isSecurity: true))
      .handler;

  var pipeline = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(MiddlewareInterception().middleware)
      .addHandler(cascadeHandler);
  await CustomServer().initialize(pipeline);
}
