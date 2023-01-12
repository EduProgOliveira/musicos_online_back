import 'package:shelf/shelf.dart';

import 'api/login_api.dart';
import 'api/user_api.dart';
import 'infra/custom_server.dart';

void main(List<String> args) async {
  var cascadeHandler =
      Cascade().add(LoginApi().handler).add(UserApi().handler).handler;

  var pipeline =
      Pipeline().addMiddleware(logRequests()).addHandler(cascadeHandler);
  await CustomServer().initialize(pipeline);
}
