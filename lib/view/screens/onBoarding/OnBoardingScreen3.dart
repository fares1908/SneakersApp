import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sneakerapp/core/constant/AppColor/AppColor.dart';
import 'package:sneakerapp/core/constant/imageAsset/imageAsset.dart';
import 'package:sneakerapp/view/widgets/onBoarding/CustomBody.dart';

class OnBoardingScreen3 extends StatelessWidget {
  const OnBoardingScreen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(827, 375));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.secondColor,
        elevation: 0,
      ),
      backgroundColor: AppColor.secondColor,
      body: Padding(
        padding: EdgeInsets.only(top: 28.h),
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
                          ImageAsset.sneakerOnBoarding3,
                          fit: BoxFit.cover,
                          width: 895.w,
                          // height: 183.49,
                        ),
                        Positioned(
                          top: 5.h,
                          left: 80.w,
                          child: Image.asset(
                            ImageAsset.smile,
                            fit: BoxFit.cover,
                            width: 77,
                            height: 77,
                          ),
                        ),
                        Image.asset(
                          ImageAsset.circle,
                          width: 845.62.w,
                          height: 248.03.h,
                        ),
                        Image.asset(
                          ImageAsset.blackEllipse,
                          width: 618.w,
                          height: 25.h,
                        ),
                      ],
                    ),
                  ),

                  const Center(
                    child: CustomBody(
                        body: 'You Have the \n Power To',
                        subBody:
                            'There Are Many Beautiful And Attractive \n Plants To Your Room'),
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
