import 'package:ai_weather/core/error/exceptions.dart';
import 'package:ai_weather/core/helper/shared_prefs_helper.dart';
import 'package:ai_weather/core/utils/strings.dart';
import 'package:ai_weather/features/auth/data/data_resources/auth_local_datasource.dart';
import 'package:ai_weather/features/auth/data/model.dart/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRemoteDatasource {
  final FirebaseAuth firebaseAuth;
  // final AuthLocalDataSourceImpl authLocalDataSource;
  final SharedPrefsHelper prefsHelper;
  AuthRemoteDatasource(
    this.firebaseAuth,
    // this.authLocalDataSource,
    this.prefsHelper,
  );
  Future<UserModel> signUp(String email, String password, String name) async {
    try {
      final result = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = UserModel(id: result.user!.uid, email: email, name: name);
      await prefsHelper.cacheUserData(user: user);
      return user;
    } on FirebaseAuthException catch (e) {
      throw ServerException(e.message ?? AppStrings.firebaseAuthException);
    }
  }

  Future<UserModel?> logIn(String email, String password) async {
    try {
      final result = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = prefsHelper.getUserData();
      if (user == null) {
        throw ServerException('User Data Not Found');
      }
      return user;
    } on FirebaseAuthException catch (e) {
      throw ServerException(e.message ?? AppStrings.firebaseAuthException);
    }
  }
}
