import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakerapp/core/constant/AppColor/AppColor.dart';
import 'package:sneakerapp/core/constant/routes/AppRoute/routersName.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed( const Duration(seconds: 2), () =>Get.offAllNamed(AppRouter.onBoarding));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/splash.png',
              width: 157,
              height: 130,
            ),

          ],
        ),
      ),
    );
  }
}
