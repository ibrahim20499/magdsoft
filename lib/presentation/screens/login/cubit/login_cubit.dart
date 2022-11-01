import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft/constants/end_points.dart';
import 'package:magdsoft/data/data_providers/remote/dio_helper.dart';
import 'package:magdsoft/data/models/account_model.dart';
import 'package:magdsoft/data/network/requests/login_request.dart';
import 'package:magdsoft/data/network/responses/login_response.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  LoginRequest? loginRequest;


  late LoginResponse loginResponse;

  ///Create Account fun by name and phone number
  void createAccount({
    required String name,
    required String phone,
  }) {
    emit(LoginLoading());

    DioHelper.postData(url: EndPoints.verifyPhone, body: {
      'name': name,
      'phone': phone,
    }, query: {}).then((value) {
      loginResponse = LoginResponse.fromJson(value.data);
      emit(LoginLoaded(
          loginResponse: loginResponse));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErorr(error.toString()));
    });
  }

   late AccountModel accountModel;

  ///Verify your Phone fun by OTP
  late Account userData;
  var verifyController1 = TextEditingController();
  var verifyController2 = TextEditingController();
  var verifyController3 = TextEditingController();
  var verifyController4 = TextEditingController();
  String code='';
  var phoneController = TextEditingController();
  var nameController = TextEditingController();

  void verifyPhone({
    required String code,
    required String phone,
  }) {
    emit(VerifyPhoneLoading());

    DioHelper.postData(url: EndPoints.otp, body: {
      'code': code,
      'phone': phone,
    }, query: {}).then((value) {
      code=verifyController1.text+
          verifyController2.text+verifyController3.text+
          verifyController4.text;
      print(code);
      accountModel = AccountModel.fromJson(value.data);
      emit(SuccessVerfiyPhone(account: accountModel));

    }).catchError((error) {
      print(error.toString());
      emit(VerifyPhoneError(error.toString()));
    });
  }
}
