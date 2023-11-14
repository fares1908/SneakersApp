import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextBody extends StatelessWidget {
  const CustomTextBody({super.key, required this.headText, required this.bodyText});
 final String headText;
 final  String bodyText;
  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        Text(
          headText,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: 'Raleway',
            fontSize: 85.sp,
          ),
        ),
        SizedBox(
          height: 6.h,
        ),
        Text(
          bodyText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 40.sp,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
