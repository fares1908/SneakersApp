import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakerapp/core/constant/AppColor/AppColor.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      title:  'Warning',
      middleText:"Do you really want to exit the application",
      actions: [
        ElevatedButton(
          style: ButtonStyle(

          ),
            onPressed: () {
              exit(0);
            },
            child: Text(
               ' confirm'
            )),
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            'cancel'
          ),
        )
      ]);
  return Future.value(true);
}
