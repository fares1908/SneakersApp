
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sneakerapp/core/class/statusrequest.dart';
import 'package:sneakerapp/core/constant/imageAsset/imageAsset.dart';


class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataView({
    Key? key,
    required this.statusRequest,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (statusRequest == StatusRequest.loading) {
      return Center(
        child: Lottie.asset(ImageAsset.loading, width: 250, height: 250),
      );
    } else if (statusRequest == StatusRequest.offlinefailure) {
      return Center(
        child: Lottie.asset(ImageAsset.offline, width: 250, height: 250),
      );
    } else if (statusRequest == StatusRequest.serverfailure) {
      return Center(
        child: Lottie.asset(ImageAsset.server, width: 250, height: 250),
      );
    } else if (statusRequest == StatusRequest.failure) {
      return Center(
        child: Lottie.asset(ImageAsset.noData, width: 250, height: 250, repeat: true),
      );
    } else {
      return widget;
    }
  }
}





class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const  HandlingDataRequest(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ?   Center(child: Lottie.asset("assets/lottie/animation_llhzeygz.json" , width: 250 , height: 250))
        : statusRequest == StatusRequest.offlinefailure
        ? Center(child: Lottie.asset(ImageAsset.offline , width: 250 , height: 250))
        : statusRequest == StatusRequest.serverfailure
        ?Center(child: Lottie.asset(ImageAsset.server , width: 250 , height: 250, repeat: true))
        : widget;
  }
}