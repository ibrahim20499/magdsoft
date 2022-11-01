part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {
  LoginResponse? loginResponse;

  LoginLoaded({required this.loginResponse});
}

class LoginErorr extends LoginState {
  final String message;

  LoginErorr(this.message);
}

class VerifyPhoneLoading extends LoginState {}

class SuccessVerfiyPhone extends LoginState {
  AccountModel? account;

  SuccessVerfiyPhone({this.account});
}

class VerifyPhoneError extends LoginState {
  final String message;

  VerifyPhoneError(this.message);
}

class ShopChangePasswordVisibilityState extends LoginState {}