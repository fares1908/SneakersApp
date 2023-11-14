import 'package:flutter/material.dart';
import 'package:sneakerapp/core/constant/AppColor/AppColor.dart';

class CustomBody extends StatelessWidget {
  const CustomBody({super.key, required this.body, required this.subBody});
  final String body;
  final String subBody;
  @override
  Widget build(BuildContext context) {
    return       Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Column(
        children: [
          Text(
            body,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColor.white,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w300,
              fontSize: 34,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
          subBody,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Poppins',
              // fontWeight: FontWeight.w700,
              color: AppColor.smoothWhite,
            ),
          )
        ],
      ),
    );
  }
}
