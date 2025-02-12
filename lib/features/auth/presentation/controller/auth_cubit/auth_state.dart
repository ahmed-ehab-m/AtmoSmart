part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class SignUpLoading extends AuthState {}

final class SignUpSuccess extends AuthState {
  final UserEntity userEntity;
  SignUpSuccess({required this.userEntity});
}

final class SignUpFailure extends AuthState {
  final String message;

  SignUpFailure({required this.message});
}
/////////////////////////////////
///final class SignUpInitial extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {
  final UserEntity userEntity;
  LoginSuccess({required this.userEntity});
}

final class LoginFailure extends AuthState {
  final String message;

  LoginFailure({required this.message});
}
