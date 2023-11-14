import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sneakerapp/core/constant/AppColor/AppColor.dart';

class CustomCardPayment extends StatelessWidget {
  const CustomCardPayment({super.key, required this.text, required this.isActive, required this.icon});
  final String text;
  final bool isActive;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          color: isActive==true?AppColor.primaryColor:AppColor.primaryColor.withOpacity(.2),
          borderRadius: BorderRadius.circular(11)),
      child:  Row(
        children: [
          Icon(
       icon,
              color:isActive==true ?Colors.white:Colors.black
          ),
          SizedBox(
            width: 6,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style:  TextStyle(
                height: 1,
                fontWeight: FontWeight.bold, color:isActive==true ?Colors.white:Colors.black),
          ),
        ],
      ),
    );
  }
}


class CustomCardShoppingAddress extends StatelessWidget {
  const CustomCardShoppingAddress(
      {super.key,
        required this.text1,
        required this.text2,
        required this.isActive});

  final String text1;
  final String text2;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Card(

      margin: EdgeInsets.all(5),
      color:isActive==true? AppColor.primaryColor:Colors.white,
      elevation: 4,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: Text(
          text1.toUpperCase(),
          textAlign: TextAlign.center,
          style:
          TextStyle(color:isActive==false?Colors.black: Colors.white,
            fontSize: 24.sp,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

