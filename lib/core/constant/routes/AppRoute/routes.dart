
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakerapp/core/constant/MyMiddelware.dart';
import 'package:sneakerapp/core/constant/routes/AppRoute/routersName.dart';
import 'package:sneakerapp/view/screens/Auth/LoginScreen.dart';
import 'package:sneakerapp/view/screens/Auth/forget_password/resetPassword.dart';
import 'package:sneakerapp/view/screens/Auth/forget_password/successResetPassword.dart';
import 'package:sneakerapp/view/screens/Auth/forget_password/verifyCode.dart';
import 'package:sneakerapp/view/screens/Auth/verifyCodeSignUp.dart';
import 'package:sneakerapp/view/screens/Auth/RegisterScreen.dart';
import 'package:sneakerapp/view/screens/Auth/SuccessSignUp.dart';
import 'package:sneakerapp/view/screens/Auth/forget_password/forgetPassword.dart';
import 'package:sneakerapp/view/screens/address/add.dart';
import 'package:sneakerapp/view/screens/address/addAddressCartScreen.dart';
import 'package:sneakerapp/view/screens/address/view.dart';
import 'package:sneakerapp/view/screens/checkOut.dart';
import 'package:sneakerapp/view/screens/favouritScreen.dart';
import 'package:sneakerapp/view/screens/SplashScreen.dart';
import 'package:sneakerapp/view/screens/homeBody.dart';
import 'package:sneakerapp/view/screens/myCartScreen.dart';
import 'package:sneakerapp/view/screens/onBoarding/OnBoarding.dart';
import 'package:sneakerapp/view/screens/home/popularShoes.dart';
import 'package:sneakerapp/view/screens/orders.dart';
import 'package:sneakerapp/view/screens/ptoductDetiels.dart';
import 'package:sneakerapp/view/screens/settingScreen.dart';
List<GetPage<dynamic>> ?routes=[
  GetPage(name: '/', page:() => const SplashScreen(),middlewares:[
    MyMiddleWare()
  ]),
  GetPage(name: AppRouter.productDetails, page:() => const ProductDetails()),
  GetPage(name: AppRouter.onBoarding, page:() =>OnBoarding()),
  GetPage(name: AppRouter.login, page:() =>LoginScreen()),
  GetPage(name: AppRouter.register, page:() => const RegisterScreen()),
  GetPage(name: AppRouter.forgetPassword, page:() =>const ForgetPassword()),
  GetPage(name: AppRouter.verifyCodeSignUp, page:() =>const VerifyCodeSignUp()),
  GetPage(name: AppRouter.home, page:() =>const HomeScreenBody()),
  GetPage(name: AppRouter.successSignUp, page:() =>const SuccessSignUp()),
  GetPage(name: AppRouter.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRouter.verfiyCode, page: () => verifyCode()),
  GetPage(
      name: AppRouter.successResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRouter.popularShoes, page: () => PopularShoes()),
  GetPage(name: AppRouter.favorite, page: () => const FavouriteScreen()),
  GetPage(name: AppRouter.cart, page: () => const CartScreen()),
  GetPage(name: AppRouter.checkOut, page: () => CheckOut()),
  GetPage(name: AppRouter.addressView, page: () => const AddressView()),
  GetPage(name: AppRouter.addressAdd, page: () =>AddressAdd()),

  GetPage(name: AppRouter.setting, page: () => const SettingScreen()),
  GetPage(name: AppRouter.addAddressCart, page: () =>  AddAddressCart()),
  GetPage(name: AppRouter.orders, page: () =>  OrdersView()),
];