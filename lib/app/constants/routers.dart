class AppRoutes {
  static final splash = "/";
  static final login = "/login";
  static final home = "/home";
  static final settings = "/settings";
  static final addVehicle = "/add_vehicle";
  static final recoverPassword = "/recover_password";
}

extension RouteExtension on String {
  String get lastPath {
    return this.split("/").last;
  }
}
