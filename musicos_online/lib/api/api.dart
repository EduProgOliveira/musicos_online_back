import 'package:musicos_online_back/infra/dependency_injector/dependency_injector.dart';
import 'package:musicos_online_back/infra/security/i_security_service.dart';
import 'package:musicos_online_back/infra/security/security_service.dart';
import 'package:shelf/shelf.dart';

abstract class Api {
  Handler getHandler({List<Middleware>? middlewares, bool isSecurity = false});

  Handler createHandler({
    required Handler router,
    List<Middleware>? middlewares,
    bool isSecurity = false,
  }) {
    var pipe = Pipeline();
    middlewares ??= [];

    if (isSecurity) {
      middlewares.addAll([
        DependencyInjector().get<ISecurityService>().authorization,
        DependencyInjector().get<ISecurityService>().verifyJWT,
      ]);
    }

    for (var element in middlewares) {
      pipe = pipe.addMiddleware(element);
    }

    return pipe.addHandler(router);
  }
}
