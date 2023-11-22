import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:orop/core/class/statusrequest.dart';
import 'package:orop/core/constant/imageasset.dart';

class HaindlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  final bool productTopSelling;
  const HaindlingDataView({
    Key? key,
    required this.statusRequest,
    required this.widget,
    this.productTopSelling = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loding
        ? Center(
            child: Lottie.asset(AppImageAsset.loading, width: 250, height: 250))
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child: Lottie.asset(AppImageAsset.offline,
                    width: 250, height: 250))
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: Lottie.asset(AppImageAsset.server,
                        width: 250, height: 250))
                : (statusRequest == StatusRequest.failure && productTopSelling)
                    ? Center(
                        child: Lottie.asset(AppImageAsset.noData,
                            width: 250, height: 250))
                    : widget;
  }
}

class HaindlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HaindlingDataRequest(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loding
        ? Center(
            child: Lottie.asset(AppImageAsset.loading, width: 250, height: 250))
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child: Lottie.asset(AppImageAsset.offline,
                    width: 250, height: 250))
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: Lottie.asset(AppImageAsset.server,
                        width: 250, height: 250))
                : widget;
  }
}
