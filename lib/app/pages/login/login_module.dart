import 'package:flutter_modular/flutter_modular.dart';
import 'package:raro_test/app/pages/login/pages/login/login_controller.dart';
import 'package:raro_test/app/pages/login/pages/login/login_page.dart';
import 'package:raro_test/app/pages/login/pages/recover_password/recover_password_controller.dart';
import 'package:raro_test/app/pages/login/pages/recover_password/recover_password_page.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => LoginController()),
    Bind((i) => RecoverPasswordController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => LoginPage()),
    ChildRoute('/recover_password', child: (_, args) => RecoverPasswordPage()),
  ];
}
