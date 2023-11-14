import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sneakerapp/core/constant/AppColor/AppColor.dart';
import 'package:sneakerapp/core/constant/imageAsset/imageAsset.dart';
import 'package:sneakerapp/view/widgets/onBoarding/CustomBody.dart';


class OnBoardingScreen2 extends StatelessWidget {
  const OnBoardingScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,  designSize: const Size(827,375));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.secondColor,
        elevation: 0,
      ),
      backgroundColor: AppColor.secondColor,
      body: Padding(
        padding:  EdgeInsets.only(top: 20.h),
        child: Center(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                children: [
                  Expanded(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Image.asset(
                          ImageAsset.sneakerOnBoarding2,
                          fit: BoxFit.cover, // Make sure to use BoxFit.cover
                          width: 895.w,
                          // height: 100.h,
                        ),
                        Positioned(
                          top: -3.h,
                          right: 36.w,
                          child: Image.asset(
                            ImageAsset.smile,
                            fit: BoxFit.cover,
                            width: 85.w,
                            height: 15.h,
                          ),
                        ),
                        Positioned(
                          top: 30.h,
                          left: 80.w,
                          child: Image.asset(
                            ImageAsset.emotion2,
                            fit: BoxFit.cover,
                            width: 90.w,
                            height: 54.h,
                          ),
                        ),
                        Image.asset(
                          ImageAsset.blackEllipse,
                          width: 618.w,
                          height: 15.h,
                        ),
                      ],
                    ),
                  ),

                  const Center(
                    child: CustomBody(
                      body: 'Let’s Start Journey \n With Nike',
                      subBody:
                          'Smart, Gorgeous & Fashionable \n Collection Explore Now',
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: Image.asset(
                  ImageAsset.rightMark,
                  fit: BoxFit.cover,
                  width: 900.2.w,
                  height: 90.6.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
