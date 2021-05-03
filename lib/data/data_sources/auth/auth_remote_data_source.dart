import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';

@injectable
class AuthRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthRemoteDataSource();

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential user = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future requestNewPassword(String email){
    return FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}
