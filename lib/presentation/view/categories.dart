import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class CategoriesCardItem extends StatelessWidget {
  const CategoriesCardItem({Key? key,required this.name,required this.image,}) : super(key: key);
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 6.w),
          child: Container(
              height: 6.2.h,
              width: 32.w,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                      blurRadius: 8,
                      spreadRadius: 4,
                      offset: const Offset(
                          2, 2), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white),
              child: Row(
                children: [
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 3.w),
                    child: Container(
                      height: 4.8.h,
                      width: 4.8.h,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color:
                              Color.fromRGBO(0, 0, 0, 0.25),
                              blurRadius: 8,
                              spreadRadius: 1,
                              offset: const Offset(2,
                                  2), // changes position of shadow
                            ),
                          ],
                          shape: BoxShape.circle,
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Image.asset(
                            image,
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Text(
                        name,
                        style: TextStyle(
                          fontSize: 15.sp,
                        ),
                      )),
                ],
              )),
        ),
      ],
    );
  }
}
