import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../theme/app_colors.dart';

abstract class BaseUiState<T extends StatefulWidget> extends State<T> {
  bool isDisposed = false;

  @override
  void dispose() {
    isDisposed = true;
    super.dispose();
  }

  @protected
  void updateUi() {
    if (!isDisposed) {
      setState(() {});
    }
  }

  @protected
  Future<void> showLoading() {
    return EasyLoading.show();
  }

  @protected
  Future<void> showProgressLoading({
    String? message,
    required double progress,
  }) {
    final percentText = (progress * 100).toStringAsFixed(0);

    if (message == null) {
      message = '$percentText%';
    } else {
      message = '$message $percentText%';
    }

    return EasyLoading.showProgress(progress, status: message);
  }

  @protected
  Future<void> hideLoading() {
    return EasyLoading.dismiss();
  }

  @protected
  Future<void> showInfoMessage(
    String message, {
    Duration? duration,
    bool? dismissOnTap,
  }) {
    return EasyLoading.showInfo(
      message,
      duration: duration,
      dismissOnTap: dismissOnTap,
    );
  }

  @protected
  Future<void> showSuccessMessage(
    String message, {
    Duration? duration,
    bool? dismissOnTap,
  }) {
    return EasyLoading.showSuccess(
      message,
      duration: duration,
      dismissOnTap: dismissOnTap,
    );
  }

  @protected
  Future<void> showErrorMessage(
    String message, {
    Duration? duration,
    bool? dismissOnTap,
    bool useMask = false,
  }) {
    return EasyLoading.showError(
      message,
      duration: duration,
      dismissOnTap: dismissOnTap,
      maskType: useMask ? EasyLoadingMaskType.black : null,
    );
  }

  @protected
  Future<void> hideMessage() {
    return EasyLoading.dismiss();
  }

  @protected
  Widget loadingWidget(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16),
      child: CircularProgressIndicator(
        backgroundColor: AppColors.primaryLight,
        valueColor: AlwaysStoppedAnimation(AppColors.primaryDark),
      ),
    );
  }

  @protected
  Widget loadingSkeletonWidget(
    BuildContext context,
    Widget child, {
    Color? color,
  }) {
    return Skeletonizer(
      containersColor: color ?? Colors.white,
      enabled: true,
      ignorePointers: true,
      child: child,
    );
  }

  @protected
  Widget errorWidget(
    BuildContext context,
    String message, {
    VoidCallback? onRetry,
  }) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: onRetry,
            style: TextButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              "Coba Lagi",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @protected
  Widget noDataWidget(
    BuildContext context,
    String? message, [
    String? imagePath,
  ]) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath ?? 'assets/images/no_data.png',
            width: 200, // Sesuaikan ukuran gambar jika perlu
            height: 200,
            fit: BoxFit.contain,
          ),
          // const SizedBox(height: 16),
          Text(
            message ?? "Data tidak tersedia",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  @protected
  Future<void> showSuccessAnimation(
    String message, {
    Duration? duration,
  }) async {
    await EasyLoading.show(
      dismissOnTap: true,
      maskType: EasyLoadingMaskType.black,
      indicator: Container(
        width: 300,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 25,
              offset: const Offset(0, 15),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TweenAnimationBuilder(
              duration: duration ?? const Duration(milliseconds: 500),
              curve: Curves.easeOutBack,
              tween: Tween<double>(begin: 0.0, end: 1.0),
              builder: (context, double scale, child) {
                return Transform.scale(
                  scale: scale,
                  child: Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFF36C653).withOpacity(0.1),
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF36C653).withOpacity(0.2),
                            width: 2,
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.check_circle,
                            color: Color(0xFF36C653),
                            size: 80,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            const Text(
              "Success!",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Color(0xFF36C653),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );

    await Future.delayed(duration ?? const Duration(seconds: 3));
    EasyLoading.dismiss();
  }

  @protected
  Future<void> showFailedAnimation(String message, {Duration? duration}) async {
    await EasyLoading.show(
      dismissOnTap: true,
      maskType: EasyLoadingMaskType.black,
      indicator: Container(
        width: 300,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 25,
              offset: const Offset(0, 15),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TweenAnimationBuilder(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOutBack,
              tween: Tween<double>(begin: 0.0, end: 1.0),
              builder: (context, double scale, child) {
                return Transform.scale(
                  scale: scale,
                  child: Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFFF82871).withOpacity(0.1),
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFFF82871).withOpacity(0.2),
                            width: 2,
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.cancel,
                            color: Color(0xFFF82871),
                            size: 80,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            const Text(
              "Failed!",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Color(0xFFF82871),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );

    await Future.delayed(duration ?? const Duration(seconds: 3));
    EasyLoading.dismiss();
  }
}
