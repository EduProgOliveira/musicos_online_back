import 'package:musicos_online_back/api/login_api.dart';
import 'package:musicos_online_back/api/user_api.dart';
import 'package:musicos_online_back/infra/dependency_injector/dependency_injector.dart';
import 'package:musicos_online_back/infra/security/i_security_service.dart';
import 'package:musicos_online_back/infra/security/security_service.dart';
import 'package:musicos_online_back/models/user_model.dart';
import 'package:musicos_online_back/service/i_generic_service.dart';
import 'package:musicos_online_back/service/user_service.dart';

class Injector {
  static DependencyInjector initialize() {
    var dep = DependencyInjector();

    dep.register<ISecurityService>(() => SecurityService());
    dep.register<IGenericService<UserModel>>(() => UserService());

    dep.register(() => LoginApi(dep.get<ISecurityService>()));
    dep.register(() => UserApi(dep.get<IGenericService<UserModel>>()));

    return dep;
  }
}