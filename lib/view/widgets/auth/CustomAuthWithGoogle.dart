import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sneakerapp/core/constant/imageAsset/imageAsset.dart';

class CustomAuthWithGoogle extends StatelessWidget {
  const CustomAuthWithGoogle({super.key, required this.textButton});
    final String textButton;
  @override
  Widget build(BuildContext context) {
    return   Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: MaterialButton(
          height: 45,
          minWidth: double.infinity,
          onPressed: () {
            print('Recovery Password');
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ImageAsset.google,
                width: 37.w,
                height: 8.h,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 20.w,
              ),
              Text(
                textButton,
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 33.sp,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
