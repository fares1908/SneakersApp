import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sneakerapp/core/constant/AppColor/AppColor.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({super.key,  required this.text1, required this.text2, this.onTapText});
   final String  text1;
  final String  text2;
  final void Function()? onTapText;
  @override
  Widget build(BuildContext context) {
    return          Row(
      children: [
        Text(
          text1,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: 'Raleway',
            fontSize: 36.sp, // Adjust the font size
            color: Colors.black,
          ),
        ),
        const Spacer(),
      InkWell(
        child:   Text(
          text2,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',

            fontSize: 26.sp, // Adjust the font size
            color: AppColor.primaryColor,
          ),
        ),
        onTap: onTapText
      )
      ],
    );
  }
}
