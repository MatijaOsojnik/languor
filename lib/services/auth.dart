import 'package:Languor/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User> get user => _auth.authStateChanges();

  Future<String> createAccount({String email, String password}) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);

      await DatabaseService(uid: result.user.uid)
          .updateUserData('unknown', 'unknown', 'unknown', 'unknown');

      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signIn({String email, String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signOut({String email, String password}) async {
    try {
      await _auth.signOut();
      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
