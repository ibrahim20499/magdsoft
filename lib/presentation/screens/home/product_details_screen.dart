import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/home/cubit/home_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/app_color.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/main_button.dart';
import 'package:sizer/sizer.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          return  Scaffold(
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
                  padding: EdgeInsets.symmetric(horizontal: 8.w, ),
                  child: SingleChildScrollView(child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8.h,),
                          //Padding(padding: EdgeInsets.only(top:4.h), child: ),
                          GestureDetector(
                            onTap: (){
                              Navigator.pushReplacementNamed(context, Routes.mainScreen);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xffFFFFFF),
                                  borderRadius: BorderRadius.circular(
                                    15,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.25),
                                      offset: Offset(2, 2),
                                      blurRadius: 5,
                                      spreadRadius: 5, // Shadow position
                                    ),
                                  ]),
                              width: 50,
                              height: 50,
                              child: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: Color(0xffB1B1B1),
                                size: 28,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "${cubit.products[0].name}\n",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18.sp,
                                    color: Color(0xfF0062BD),
                                  ),
                                ),
                                TextSpan(
                                  text: "Type: ${cubit.products[0].type}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    color: Color(0xff464646),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Container(
                            height: 30.h,
                            width: double.infinity,
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(cubit.products[0].image),
                                  fit: BoxFit.cover
                              ),
                              color: Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(0, 2),
                                  blurRadius: 4.0,
                                  spreadRadius: 5, // Shadow position
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                  Container(
                    height: 14.h,
                    width: 33.w,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.2),
                          offset: Offset(0, 2),
                          blurRadius: 4.0,
                          spreadRadius: 5, // Shadow position
                        ),
                      ],
                      image: DecorationImage(
                        image:
                        NetworkImage(cubit.products[0].image,),
                      ),
                    ),
                  ),
                          // SizedBox(
                          //   height: 14.h,
                          //   child: ListView.builder(
                          //     scrollDirection: Axis.horizontal,
                          //     physics: const BouncingScrollPhysics(
                          //         parent: AlwaysScrollableScrollPhysics()),
                          //     shrinkWrap: true,
                          //     itemCount: cubit.products.,
                          //     itemBuilder: (BuildContext context, int index) {
                          //       return
                          //     },
                          //   ),
                          // ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Container(
                            height: 9.h,
                            width: double.infinity,
                            padding: EdgeInsets.only(top: 1.3.h),
                            decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.2),
                                  offset: Offset(0, 2),
                                  blurRadius: 4.0,
                                  spreadRadius: 5, // Shadow position
                                ),
                              ],
                            ),
                            child: ListTile(
                              leading: Container(
                                width: 15.w,
                                height: 8.h,
                                decoration: BoxDecoration(
                                    color: Color(0xffFFFFFF),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.2),
                                        offset: Offset(0, 0),
                                        blurRadius: 4.0,
                                        spreadRadius: 2, // Shadow position
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/acerLogo.png"))),
                              ),
                              title: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Acer Official Store\n",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13.sp,
                                        color: Color(0xfF464646),
                                      ),
                                    ),
                                    TextSpan(
                                      text: "View Store",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10.sp,
                                        color: Color(0xffB1B1B1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              trailing: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xffF3F3F3),
                                    borderRadius: BorderRadius.circular(
                                      5,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.25),
                                        offset: Offset(0, 2),
                                        blurRadius: 4,
                                        spreadRadius: 1, // Shadow position
                                      ),
                                    ]),
                                width: 10.w,
                                height: 4.h,
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Color(0xff0062BD),
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Padding(padding: EdgeInsets.only(left: 5),child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 5.5.h,
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Price\n",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                          color: Color(0xfFB1B1B1),
                                        ),
                                      ),
                                      TextSpan(
                                        text: "30,000 EGP",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.sp,
                                          color: Color(0xff464646),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),),

                              MainButton(
                                child: Text(
                                  "Add To Cart",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13.sp,
                                  ),
                                ),
                                borderRadius: 10.0,
                                height: 5.5.h,
                                width: 45.w,
                                onPressed: () {
                                },
                              ),
                            ],
                          ),),
                          SizedBox(
                            height: 3.h,
                          ),
                          Divider(
                            thickness: 2,
                            color: Color(0xfFB1B1B1),
                            indent: 20,
                            endIndent: 20,
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                        ],
                      ),),
                ),
              ),
            );
        });
  }
}
