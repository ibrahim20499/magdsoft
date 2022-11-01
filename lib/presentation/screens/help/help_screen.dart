import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft/presentation/screens/home/cubit/home_cubit.dart';
import 'package:magdsoft/presentation/styles/app_color.dart';
import 'package:magdsoft/presentation/widget/main_button.dart';
import 'package:sizer/sizer.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          return Scaffold(
            body: Container(
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColor.primary.withOpacity(0.85),
                      AppColor.primary.withOpacity(0),
                      AppColor.primary.withOpacity(0),
                    ]),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 6.7.h),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Help",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontSize: 30.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        // padding: EdgeInsets.all(20),
                        // height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                          itemCount: cubit.help.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.w, vertical: 2.h),
                              child: Container(
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.25),
                                        blurRadius: 8,
                                        spreadRadius: 2,
                                        offset: const Offset(
                                            2, 2), // changes position of shadow
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColor.white),
                                width: double.infinity,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: ExpansionTile(
                                      title: Text(
                                        cubit.help[index].question,
                                        style: TextStyle(
                                            color: AppColor.primary,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13.sp),
                                      ),
                                      backgroundColor: AppColor.white,
                                      collapsedIconColor: AppColor.text,
                                      iconColor: AppColor.text,
                                      children: [
                                        ListTile(
                                            title: Padding(
                                          padding: EdgeInsets.only(bottom: 2.h),
                                          child: Text(
                                            cubit.help[index].answer,
                                            maxLines: 5,
                                            style: TextStyle(
                                                color: AppColor.text,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12.sp),
                                          ),
                                        )),
                                      ]),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 2.h),
                        child: MainButton(
                          child: Text(
                            "Continue",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 13.sp,
                                color: AppColor.white),
                          ),
                          borderRadius: 50.0,
                          height: 5.2.h,
                          width: 60.w,
                          onPressed: () {
                            // Navigator.pushReplacement(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => VerifyPhone(),
                            //   ),);
                          },
                        ),
                      ),
                    ]),
              ),
            ),
          );
        });
  }
}
