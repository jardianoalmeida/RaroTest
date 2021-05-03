import 'dart:convert';

import 'package:raro_test/domain/entities/auth/auth_entity.dart';


extension AuthMapper on AuthEntity {
  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
    };
  }

  AuthEntity? fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AuthEntity(
      username: map['username'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  AuthEntity? fromJson(String source) =>
      source == null || source.isEmpty ? null : fromMap(json.decode(source));
}
