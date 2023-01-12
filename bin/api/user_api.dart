import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class UserApi {
  Handler get handler {
    Router router = Router();
    router.get('/user', (Request request) {
      return Response.ok('User');
    });
    return router;
  }
}
