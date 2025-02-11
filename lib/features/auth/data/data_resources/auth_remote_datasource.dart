import 'package:ai_weather/core/error/exceptions.dart';
import 'package:ai_weather/features/auth/data/model.dart/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteDatasource {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<UserModel> signUp(String email, String password) async {
    try {
      final result = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return UserModel(
        id: result.user!.uid,
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw ServerException(e.message ?? "Firebase Auth Error");
    }
  }

  Future<UserModel> logIn(String email, String password) async {
    try {
      final result = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return UserModel(
        id: result.user!.uid,
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw ServerException(e.message ?? "Firebase Auth Error");
    }
  }
}
