import 'package:flutter/material.dart';
import 'package:sneakerapp/core/constant/AppColor/AppColor.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, required this.textButton});
  final void Function()? onPressed;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .03),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: MaterialButton(
          minWidth: 325,
          color: AppColor.white,
          height: 50,
          onPressed:onPressed,
          child:  Text(
                 textButton,
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ),
    );
  }
}
