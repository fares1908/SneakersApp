import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sneakerapp/core/constant/AppColor/AppColor.dart';
import 'package:sneakerapp/core/constant/routes/AppRoute/routersName.dart';
import 'package:sneakerapp/core/services/services.dart';
import 'package:sneakerapp/view/screens/onBoarding/OnBoardingScreen1.dart';
import 'package:sneakerapp/view/screens/onBoarding/OnBoardingScreen3.dart';
import 'package:sneakerapp/view/screens/onBoarding/onBoardingScreen2.dart';
import 'package:sneakerapp/view/widgets/onBoarding/CustomButton.dart';


class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  List <Widget>onBoardingScreens=[
    const OnBoardingScreen1(),
    const OnBoardingScreen2(),
    const OnBoardingScreen3(),
  ];

   MyServices services=Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColor.secondColor ,
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: onboardingScreens.length, // Number of onboarding screens
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 90),
                child: onboardingScreens[index],
              ); // Use the widget at index
            },
          ),
          Positioned(
            right:MediaQuery.of(context).size.width*.4,
            bottom: 110,
            child: SmoothPageIndicator(
              controller: _controller,
              count: onboardingScreens.length,
              effect: const ExpandingDotsEffect(
                dotColor: Colors.orange,
                dotHeight: 4,
                expansionFactor: 2.4,

                spacing: 5,
                activeDotColor: AppColor.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                textButton: _currentPage==0?'Get Started' :'Next',
                onPressed: () {
                  print(_currentPage);
                   if (_currentPage==onBoardingScreens.length-1){
                     services.sharedPreferences.setString('step', "1");
                     print(services.sharedPreferences.getString("step"));
                     Get.offAllNamed(AppRouter.login);

                   }else{
                     _controller.nextPage(duration:  const Duration(milliseconds: 500), curve: Curves.easeInCubic);
                   }

                },
              ),
            ),
          ),
        ],

      ),
    );
  }
}

// Define your OnBoardingScreen widgets here
final List<Widget> onboardingScreens = [
  const OnBoardingScreen1(),
  const OnBoardingScreen2(),
  const OnBoardingScreen3(),
];