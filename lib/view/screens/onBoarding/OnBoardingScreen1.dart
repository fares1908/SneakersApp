import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import flutter_screenutil
import 'package:sneakerapp/core/constant/AppColor/AppColor.dart';
import 'package:sneakerapp/core/constant/imageAsset/imageAsset.dart';
import 'package:sneakerapp/view/widgets/onBoarding/CustomButton.dart';

class OnBoardingScreen1 extends StatelessWidget {
  const OnBoardingScreen1({Key? key});

  @override
  Widget build(BuildContext context) {
    // Initialize flutter_screenutil
    ScreenUtil.init(context,  designSize: const Size(827,375));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.secondColor,
        elevation: 0,
      ),
      backgroundColor: AppColor.secondColor,
      body: Padding(
        padding: EdgeInsets.only(top: 15.h),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 40.h),
                    child: Image.asset(
                      ImageAsset.rightMark,
                      fit: BoxFit.cover,
                      width: 900.2.w,
                      height: 90.6.h,
                    ),
                  ),
                  Column(
                    children: [
                      Center(
                        child: Stack(

                          children: [
                            Positioned(
                              top:-24,
                              child: Image.asset(
                                ImageAsset.stackText,
                                height: 36.7.h,
                                width: 45.4.w,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(6.h),
                              child: Text(
                                'WELCOME TO \n NIKE',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Raleway',
                                  fontSize: 60.sp,
                                  color: AppColor.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        ImageAsset.underLine,
                        width: 153.4.w,
                        height: 12.8.h,
                      ),
                      Image.asset(
                        ImageAsset.sneakerOnBoarding1,
                        fit: BoxFit.cover,
                        width: 950.08.w,
                        height: 190.06.h,
                      ),

                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2.h),
                    child: Image.asset(
                      ImageAsset.emotion,
                    ),
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
