import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:sneakerapp/core/constant/AppColor/AppColor.dart';

import 'package:sneakerapp/core/constant/imageAsset/imageAsset.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[100],

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Center(child: Text('UserScreen'))
          ],
        ),
      ),
    );
  }
}
