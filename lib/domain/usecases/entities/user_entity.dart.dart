//@dart=2.10
import 'package:flutter/foundation.dart';

/// Business object of the application
/// Least likely to change when something in the application changes
/// All mapper methods must be inserted in corresponding entity mapper at Data Layer

@immutable
class UserEntity {
  final String email;

  UserEntity({
    this.email,
  });

  @override
  String toString() => 'UserModel(email: $email)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UserEntity && o.email == email;
  }

  @override
  int get hashCode => email.hashCode;
}
