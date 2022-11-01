import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/help/help_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/home/home_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/login/cubit/login_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/main_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';

class VerifyPhone extends StatelessWidget {
   VerifyPhone({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String code='0000';
    String phone='';
    return SafeArea(
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
      if (state is SuccessVerfiyPhone) {
        if (state.account! != null) {
          showToast(
            text: 'Successfully verified',
            state: ToastStates.SUCCESS,
          );
          Navigator.pushReplacementNamed(context, Routes.mainScreen);
          CacheHelper.saveDataSharedPreference(
            key: 'token',
            value: state.account?.account?.id,
          ).then((value) {
            var token = state.account?.account?.id;
          });
        } else {
          showToast(
            text: 'لم يتم تسجيل الدخول',
            state: ToastStates.ERROR,
          );
        }
      }
    }, builder: (context, state) {
    LoginCubit cubit = LoginCubit.get(context);

    return state is VerifyPhoneLoading
    ? const Scaffold(body: Center(child: CircularProgressIndicator()))
        :Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 62.0, horizontal: 46),
              height: 350,
              // height: MediaQuery.of(context).size.height * 0.65,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(0, 98, 189, 0.85),
                  Color.fromRGBO(0, 98, 189, 0)
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
              child: Column(
                children: [
                  Text(
                    "Verify Phone",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 30.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Form(
                    key: formKey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 70,
                            height: 80,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  //borderSide: BorderSide(color: Color(0xff))
                                ),
                                fillColor: Color(0xffFFFFFF),
                                filled: true,
                              ),
                              keyboardType: TextInputType.number,
                              keyboardAppearance: Brightness.light,

                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.center,
                            )),
                        SizedBox(
                            width: 70,
                            height: 80,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                fillColor: Color(0xffFFFFFF),
                                filled: true,
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.center,
                            )),
                        SizedBox(
                            width: 70,
                            height: 80,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                fillColor: Color(0xffFFFFFF),
                                filled: true,
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.center,
                            )),
                        SizedBox(
                            width: 70,
                            height: 80,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                fillColor: Color(0xffFFFFFF),
                                filled: true,
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.center,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.zero,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Resend Code",
                  style: TextStyle(
                    color: Color(0xff0062BD),
                    fontSize: 20.0,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 44,vertical: 50),
              child:MainButton(
              child: Text(
                "Verify",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              borderRadius: 50.0,
              height: 57,
              width: double.infinity,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  LoginCubit.get(context).verifyPhone(
                    code: cubit.code,
                    phone: LoginCubit.get(context).phoneController.text,
                  );
                }
              },
            ),),
          ],
        ),
      );}));
  }
}
