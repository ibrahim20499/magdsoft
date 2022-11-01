import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class ProductCard extends StatelessWidget {
   ProductCard({
    Key? key,
    this.onTap,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
  }) : super(key: key);
  final String name;
  final String price;
  final String description;
  final String image;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.w,
        height: 32.h,
        decoration: BoxDecoration(
          color: Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(
            20,
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(2, 2),
              blurRadius: 8.0,
              spreadRadius: 4, // Shadow position
            ),
          ],
        ),
        child: Stack(
          children: [
            Container(
              height: 18.h,
              width: 50.w,
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(image),
                  // fit: BoxFit.fill,
                ),
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    offset: Offset(0, 0),
                    blurRadius: 4.0,
                    spreadRadius: 2, // Shadow position
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border_rounded,
                      color: Color(0xff52575A),
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h, left: 3.w),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "$name \n",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 11.sp,
                        color: Color(0xfF0062BD),
                      ),
                    ),
                    TextSpan(
                      text: "$description\n \n",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10.sp,
                        color: Color(0xff464646),
                      ),
                    ),
                    TextSpan(
                      text: "$price EGP",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10.sp,
                        color: Color(0xff464646),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 27.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 5.h,
                    width: 11.w,
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Color(0xff0062BD),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(0, 98, 189, 1),
                        Color.fromRGBO(0, 98, 189, 0.5)
                      ], begin: Alignment.topRight, end: Alignment.bottomLeft),
                    ),
                    child: Icon(
                      Icons.add,
                      color: Color(0xffFFFFFF),
                      size: 28,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
