import 'package:musicos_online_back/api/api.dart';
import 'package:musicos_online_back/infra/security/i_security_service.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class LoginApi extends Api {
  final ISecurityService _securityService;

  LoginApi(this._securityService);

  @override
  Handler getHandler({List<Middleware>? middlewares, bool isSecurity = false}) {
    Router router = Router();
    router.post('/login', (Request request) async {
      var token = await _securityService.generateJWT('1');
      //var resp = _securityService.validateJWT(token);
      return Response.ok(token);
    });
    return createHandler(
        router: router, middlewares: middlewares, isSecurity: isSecurity);
  }
}
