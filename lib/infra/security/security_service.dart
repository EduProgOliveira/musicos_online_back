import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:musicos_online_back/infra/security/i_security_service.dart';
import 'package:shelf/shelf.dart';

class SecurityService implements ISecurityService<JWT> {
  @override
  Future<String> generateJWT(String userID) async {
    final jwt = JWT({'id': userID});
    return jwt.sign(SecretKey('key'));
  }

  @override
  Future<JWT?> validateJWT(String token) async {
    try {
      return JWT.verify(token, SecretKey('key'));
    } on JWTExpiredError {
      print('jwt expired');
      return null;
    } on JWTInvalidError {
      return null;
    } on JWTNotActiveError {
      return null;
    } on JWTError catch (ex) {
      print(ex.message);
      return null;
    }
  }

  @override
  Middleware get authorization {
    return (Handler handler) {
      return (Request request) async {
        JWT? jwt;
        String? authorizationHeader = request.headers['Authorization'];
        if (authorizationHeader != null) {
          if (authorizationHeader.startsWith('Bearer ')) {
            jwt = await validateJWT(authorizationHeader.substring(7));
          }
        }

        return handler(request.change(context: {'jwt': jwt}));
      };
    };
  }

  @override
  Middleware get verifyJWT => createMiddleware(
        requestHandler: (Request request) {
          if (request.context['jwt'] == null) {
            return Response.forbidden('Not Authorized');
          }
          return null;
        },
      );
}
