import 'package:flutter/foundation.dart';

@immutable
class UserEntity {
  final String? accessToken;
  final String? refreshToken;

  const UserEntity({
    this.accessToken,
    this.refreshToken,
  });

  @override
  String toString() =>
      'UserEntity(accessToken: $accessToken, refreshToken: $refreshToken)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UserEntity &&
        o.accessToken == accessToken &&
        o.refreshToken == refreshToken;
  }

  @override
  int get hashCode => accessToken.hashCode ^ refreshToken.hashCode;
}
