import 'package:musicos_online_back/api/login_api.dart';
import 'package:musicos_online_back/api/user_api.dart';
import 'package:musicos_online_back/dao/user_dao.dart';
import 'package:musicos_online_back/infra/custom_server.dart';
import 'package:musicos_online_back/infra/database/i_db_configuration.dart';
import 'package:musicos_online_back/infra/dependency_injector/injector.dart';
import 'package:musicos_online_back/infra/middleware_interception.dart';
import 'package:shelf/shelf.dart';

void main(List<String> args) async {
  var dep = Injector.initialize();

  await dep.get<IDbConfiguration>().connection;
  UserDao _user = UserDao(dep.get<IDbConfiguration>());
  print((await _user.findOne(1)).email);

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
