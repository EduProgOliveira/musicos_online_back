import 'package:shelf/shelf.dart';

abstract class ISecurityService<T> {
  Future<String> generateJWT(String userID);
  Future<T?> validateJWT(String token);

  Middleware get verifyJWT;
  Middleware get authorization;
}
