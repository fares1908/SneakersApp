import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.titleText,
      this.controller,
      this.suffixIcon,
      this.onTapIcon,
      this.obscureText = false,
      required this.valid,
      required this.isNumber});
  final String? titleText;
  final TextEditingController? controller;
  final IconData? suffixIcon;
  final void Function()? onTapIcon;
  final bool? obscureText;
  final String? Function(String?) valid;
  final bool isNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText ?? "",
          style: TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w700,
            fontSize: 36.sp,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 6.h,
        ),
        TextFormField(
          keyboardType: isNumber == true
              ? const TextInputType.numberWithOptions(decimal: true)
              : TextInputType.text,
          validator: valid,
          obscureText: obscureText ?? false,
          controller: controller,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 27.sp,
            color: Colors.grey,
          ),
          cursorColor: Colors.grey,
          decoration: InputDecoration(
            suffixIcon: InkWell(
              onTap: onTapIcon,
              child: Icon(suffixIcon),
            ),
            focusColor: Colors.grey,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey.withOpacity(.14),
          ),
        ),
      ],
    );
  }
}
