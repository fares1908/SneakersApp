import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.text, this.controller, this.onPressed, this.onChanged});
 final String text;
 final TextEditingController? controller;
  final void Function()? onPressed;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(

      controller:controller ,
      onChanged: onChanged,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 27.sp,
        color: Colors.grey,
      ),
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical: 8, horizontal: 10),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 11),
          child: IconButton(
            icon: const Icon(
              IconlyLight.search,
              color: Colors.grey,
              size: 16,
            ),
            onPressed:onPressed,
          ),
        ),
        focusColor: Colors.grey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: text,
        hintStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 31.sp,
          color: Colors.grey,
        ),
      ),
    );
  }
}
