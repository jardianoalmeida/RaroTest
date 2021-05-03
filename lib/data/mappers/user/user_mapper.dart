import 'dart:convert';

import 'package:raro_test/domain/entities/user/user_entity.dart';


extension UserMapper on UserEntity {
  UserEntity copyWith({
    String? accessToken,
    String? refreshToken,
  }) {
    return UserEntity(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'access': accessToken,
      'refresh': refreshToken,
    };
  }

  UserEntity? fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserEntity(
      accessToken: map['access'],
      refreshToken: map['refresh'],
    );
  }

  String toJson() => json.encode(toMap());

  UserEntity? fromJson(String source) {
    if (source == null || source.isEmpty) return null;
    return fromMap(json.decode(source));
  }
}
