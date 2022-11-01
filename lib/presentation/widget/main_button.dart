import 'package:flutter/material.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    required this.child,
    this.onPressed,
    this.width = double.infinity,
    this.borderRadius = 10,
    this.height = 40,
  });
  final Widget child;
  final void Function()? onPressed;
  final double? width;
  final double? height;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius!),
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(0, 98, 189, 1),
            Color.fromRGBO(0, 98, 189, 0.5),
            Color.fromRGBO(0, 98, 189, 0.27),
          ],end: Alignment.centerLeft,
          begin: Alignment.centerRight,

        ),
        // gradient: LinearGradient(
        //     begin: Alignment.centerLeft,
        //     end: Alignment.centerRight,
        //     colors: [
        //       AppColor.primary.withOpacity(1),
        //       AppColor.primary.withOpacity(0.5),
        //       AppColor.primary.withOpacity(0.27),
        //     ]),
      ),
      width: width!,
      height: height!,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius!,
            ),
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
