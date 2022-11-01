import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft/presentation/screens/login/cubit/login_cubit.dart';
import 'package:magdsoft/presentation/screens/login/verify_phone.dart';
import 'package:magdsoft/presentation/widget/custom_text_filed_widget.dart';
import 'package:magdsoft/presentation/widget/main_button.dart';
import 'package:magdsoft/presentation/widget/toast.dart';
import 'package:magdsoft/presentation/router/app_router.dart';
import 'package:sizer/sizer.dart';
class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

    return BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
      if (state is LoginLoaded) {
        if (state.loginResponse!.status == 200) {
          showToast(
            text: '${state.loginResponse?.message} OTP:${state.loginResponse?.code}',
            state: ToastStates.SUCCESS,
          );
          Navigator.pushReplacementNamed(context, Routes.verifyScreen);
        } else {
          showToast(
            text: state.loginResponse?.message ?? 'لم يتم تسجيل الدخول',
            state: ToastStates.ERROR,
          );
        }
      }
    }, builder: (context, state) {
      var cubit=LoginCubit.get(context);
    return state is LoginLoading
        ? const Scaffold(body: Center(child: CircularProgressIndicator()))
        :Scaffold(
      body: Stack(
          children: [
        // const SizedBox(
        //   width: double.infinity,
        //   height: 386,
        //   child: Image(
        //     image: AssetImage('assets/images/logo.png'),
        //     fit: BoxFit.fill,
        //   ),
        // ),
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 35.h),
          child: Container(
            padding: EdgeInsets.all(30),
            width: double.infinity,
            height: 65.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60), topRight: Radius.circular(60)),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 35.h),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: .1.h,
                        width: 35.w,
                        color: Color(0xff639FD7),
                      ),
                       Text(' OR ',
                          style: TextStyle(
                              color: Color(0xff0062BD), fontSize: 12.sp,)),
                      Container(
                        height: .1.h,
                        width: 35.w,
                        color: Color(0xff639FD7),
                      ),
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 12.h,right: 15.w, left: 15.w),
                    child:Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width:13.w,
                        height: 5.8.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          color: Color(0xffFFFFFF),
                          boxShadow: [
                            BoxShadow(
                              color:Color.fromRGBO(0, 0, 0, 0.25),
                              offset: Offset(2, 5),
                              blurRadius: 20.0,
                              spreadRadius: 1, // Shadow position
                            ),
                          ],
                          image: DecorationImage(
                            image: AssetImage("assets/images/f.png"),
                          ),
                        ),
                      ),
                      Container(
                        // width:52,
                        // height: 52.0,
                        width:13.w,
                        height: 5.8.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          color: Color(0xffFFFFFF),
                          boxShadow: [
                            BoxShadow(
                              color:Color.fromRGBO(0, 0, 0, 0.25),
                              offset: Offset(2, 5),
                              blurRadius: 20.0,
                              spreadRadius: 1, // Shadow position
                            ),
                          ],
                          image: DecorationImage(
                            image: AssetImage("assets/images/ios.png"),
                          ),
                        ),
                      ),
                      Container(
                        width:13.w,
                        height: 5.8.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          color: Color(0xffFFFFFF),
                          boxShadow: [
                            BoxShadow(
                              color:Color.fromRGBO(0, 0, 0, 0.25),
                              offset: Offset(2, 5),
                              blurRadius: 20.0,
                              spreadRadius: 1, // Shadow position
                            ),
                          ],
                          image: DecorationImage(
                            image: AssetImage("assets/images/google.png"),
                          ),
                        ),
                      ),
                    ],
                  ),),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 193, left: 29, right: 29),
          child: Container(
            height: 345,
            width: 372,
            decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color:Color.fromRGBO(0, 0, 0, 0.25),
                    offset: Offset(2, 5),
                    blurRadius: 20.0,
                    spreadRadius: 5, // Shadow position
                  ),
                ]),
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
                child: Form(key: formKey ,child:Column(
                  children: [
                    Text(
                      "Welcome",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xff464646),
                          fontSize: 30.0,
                          fontFamily: "Inter"),
                    ),
                    Divider(
                      thickness: 3.13,
                      color: Color(0xff0062BD),
                      height: 25,
                      indent: 60,
                      endIndent: 60,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomTextFiledWidget(
                      subText: "Enter your Full Name",
                      controller: nameController,
                      validate: (name) {
                        if (name!.length < 5) {
                          return "Your Name is too Short";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    CustomTextFiledWidget(
                      subText: "Enter your Full Name",
                      controller: phoneController,
                      validate: (phone) {
                        if (phone!.length < 11) {
                          return "Your Phone Number is Wrong";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    MainButton(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      borderRadius: 50.0,
                      height: 48.01,
                      width: double.infinity,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          LoginCubit.get(context)
                              .createAccount(
                            name: nameController.text,
                            phone: phoneController.text,
                          );
                        }
                      },
                    ),
                  ],
                ))),
          ),
        ),
      ]),
    );});
  }
}
