import 'package:shelf/shelf.dart';

abstract class Api {
  Handler getHandler({List<Middleware>? middlewares});

  Handler createHandler({
    required Handler router,
    List<Middleware>? middlewares,
  }) {
    middlewares ??= [];
    var pipe = Pipeline();

    for (var element in middlewares) {
      pipe.addMiddleware(element);
    }
    return pipe.addHandler(router);
  }
}
