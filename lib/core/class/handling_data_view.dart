import 'package:eltayar/core/class/status_request.dart';
import 'package:eltayar/core/constant/image_url.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: Lottie.asset(ImageUrl.loading))
        : statusRequest == StatusRequest.offlineFailure
            ? Center(
                child: Lottie.asset(ImageUrl.offline, width: 250, height: 250))
            : statusRequest == StatusRequest.severFailure
                ? Center(child: Lottie.asset(ImageUrl.serverError))
                : statusRequest == StatusRequest.noDatafailur
                    ? Center(child: Lottie.asset(ImageUrl.nodata))
                    : widget;
  }
}
