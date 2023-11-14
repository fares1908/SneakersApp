import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAuthRow extends StatelessWidget {
  const CustomAuthRow({super.key, required this.text, required this.textButton, this.onPressed});
   final String text;
   final String textButton;
 final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
         text,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 37.sp,
            color: Colors.grey,
          ),
        ),
        TextButton(
          onPressed:onPressed,
          child: Text(
            textButton,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
              fontSize: 37.sp,
            ),
          ),
        ),
      ],
    );
  }
}
