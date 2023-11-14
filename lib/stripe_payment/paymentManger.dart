
import 'dart:convert';

import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:sneakerapp/core/constant/routes/AppRoute/routersName.dart';

import 'apiKeys.dart';
abstract class PaymentManagerStrip{

  static Future<void>makePayment(int amount,String currency)async{
    try {
      String clientSecret=await _getClientSecret((amount*100).toString(), currency);
      await _initializePaymentSheet(clientSecret);
      await Stripe.instance.presentPaymentSheet();

    } catch (error) {
      throw Exception(error.toString());
    }
  }

  static Future<void>_initializePaymentSheet(String clientSecret)async{
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: "Basel",
      ),
    );
  }

 static Future<String> _getClientSecret(String amount, String currency) async {
    final String url = 'https://api.stripe.com/v1/payment_intents';
    final Map<String, String> headers = {
      'Authorization': 'Bearer ${ApiKeys.privateKey}',
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    final Map<String, String> body = {
      'amount': amount,
      'currency': currency,
    };

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {

      // Assuming the response is in JSON format, you may need to handle parsing accordingly.
      final Map<String, dynamic> responseData = json.decode(response.body);
      return responseData["client_secret"];

    } else {
      throw Exception('Failed to fetch client secret');
    }
  }


}