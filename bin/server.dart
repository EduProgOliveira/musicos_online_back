import 'package:musicos_online_back/api/login_api.dart';
import 'package:musicos_online_back/api/user_api.dart';
import 'package:musicos_online_back/infra/custom_server.dart';
import 'package:musicos_online_back/service/user_service.dart';
import 'package:shelf/shelf.dart';

void main(List<String> args) async {
  var cascadeHandler = Cascade()
      .add(LoginApi().handler)
      .add(UserApi(UserService()).handler)
      .handler;

  var pipeline =
      Pipeline().addMiddleware(logRequests()).addHandler(cascadeHandler);
  await CustomServer().initialize(pipeline);
}
