import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sneakerapp/core/constant/imageAsset/imageAsset.dart';

import 'core/constant/AppColor/AppColor.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(827, 375));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: 10.h),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Column(
                    children: [
                      Text(
                        'Register Account',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Raleway',
                          fontSize: 85.sp,
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Text(
                        'Fill Your Details Or Continue With \n Social Media',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 40.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(11.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Name',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w700,
                            fontSize: 36.sp,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        TextField(
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 27.sp,
                            color: Colors.grey,
                          ),
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            focusColor: Colors.grey,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.grey.withOpacity(.14),
                          ),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          'Email Address',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w700,
                            fontSize: 36.sp,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        TextField(
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 27.sp,
                            color: Colors.grey,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            focusColor: Colors.grey,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.grey.withOpacity(.14),
                          ),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          'Password',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 36.sp,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        TextField(
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 27.sp,
                            color: Colors.grey,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.remove_red_eye,
                                color: Colors.grey,
                              ),
                            ),
                            focusColor: Colors.grey,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.grey.withOpacity(.14),
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {},
                            child: Text(
                              'Recovery Password',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 27.sp,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 9.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: MaterialButton(
                              shape: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColor.primaryColor,
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              height: 45,
                              minWidth: double.infinity,
                              onPressed: () {
                                print('Recovery Password');
                              },
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  color: AppColor.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 9.h,
                        ),
                        Container(
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
                                    'Sign In With Google',
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already Have Account?',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 37.sp,
                    color: Colors.grey,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 37.sp,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
