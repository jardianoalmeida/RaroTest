import 'package:flutter/foundation.dart';

@immutable
class AuthEntity {
  final String? username;
  final String? password;

  AuthEntity({this.username, this.password});

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AuthEntity && o.username == username && o.password == password;
  }

  @override
  int get hashCode => username.hashCode ^ password.hashCode;

  AuthEntity copyWith({
    String? username,
    String? password,
  }) {
    return AuthEntity(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}
