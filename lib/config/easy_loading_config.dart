import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../core/theme/app_colors.dart';

class EasyLoadingConfig {
  static void setup() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..maskType = EasyLoadingMaskType.black
      ..loadingStyle = EasyLoadingStyle.custom
      ..backgroundColor = Colors.transparent
      ..boxShadow = <BoxShadow>[]
      ..indicatorSize = 45.0
      ..contentPadding = const EdgeInsets.all(0)
      ..lineWidth = 2.0
      ..indicatorColor = AppColors.primary
      ..indicatorWidget = const CircularProgressIndicator(
        backgroundColor: AppColors.primaryLight,
        valueColor: AlwaysStoppedAnimation(AppColors.primaryDark),
      )
      ..radius = 20.0
      ..textColor = AppColors.primary
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false;
    // ..loadingStyle = EasyLoadingStyle.dark // default bawaan
    // ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    // ..maskType = EasyLoadingMaskType.black
    // ..userInteractions = true
    // ..dismissOnTap = false;
  }
}
