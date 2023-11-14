import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sneakerapp/core/class/InitialBindings.dart';
import 'package:sneakerapp/core/constant/routes/AppRoute/routes.dart';
import 'package:sneakerapp/core/services/services.dart';
import 'package:sneakerapp/stripe_payment/apiKeys.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey=ApiKeys.publicKey;
  try {
    await initialServices();
    runApp(const MyApp());
  } catch (e) {
    // Handle initialization error
    print('Initialization error: $e');
  }
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(827, 375),
      builder: (BuildContext c, child) => GetMaterialApp(
        initialBinding: initialBinding(),
        getPages: routes,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
