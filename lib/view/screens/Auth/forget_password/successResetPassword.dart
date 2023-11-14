import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sneakerapp/core/constant/AppColor/AppColor.dart';
import 'package:sneakerapp/core/constant/routes/AppRoute/routersName.dart';
import 'package:sneakerapp/view/widgets/auth/customButtonAuth.dart';
import 'package:sneakerapp/view/widgets/onBoarding/CustomButton.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Congratulations',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 26,
            fontFamily: 'Poppins',
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Icon(
                Icons.check_circle_outline,
                color: AppColor.primaryColor,
                size: 390.w,
              ),
            ),
            const Text(
              'Successfully Reset Password',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins',
              ),
            ),
            const Spacer(),
            SizedBox(
                width: double.infinity,
                child: CustomButtonAuth(
                  textButton: "Go to Log In",
                  onPressed: () {
                    Get.offNamed(AppRouter.login);
                  },
                )),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
