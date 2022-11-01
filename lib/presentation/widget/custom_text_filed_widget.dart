import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomTextFiledWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String subText;
  final IconData? icon;
  final FormFieldValidator<String>? validate;


  const CustomTextFiledWidget({
    Key? key,
    required this.subText,
    this.icon,
    this.controller,
    this.validate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 48.01,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
            boxShadow: [
            BoxShadow(
              color:Color.fromRGBO(0, 0, 0, 0.25),
      offset: Offset(2, 2),
      blurRadius: 8.0,
      spreadRadius: 2, // Shadow position
    ),],
          color: Color(0xffFFFFFF),
        ),
        child: TextFormField(
          validator: validate,
          textAlign: TextAlign.start,
          controller: controller,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            border: new OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: new BorderSide(color: Colors.black12)),
            //border: InputBorder.none,
            hintText: subText,
            hintStyle: TextStyle(
              color: Color(0xffB1B1B1),
              fontSize: 10,
              fontWeight: FontWeight.w400,
               fontStyle: FontStyle.normal,
              fontFamily: "Inter",
            ),
          ),
        ));
  }
}
