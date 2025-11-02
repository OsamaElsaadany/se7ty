import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:se7ty/core/constants/assetsimages.dart';
import 'package:se7ty/core/utils/colors.dart';

enum DialogType { error, success }

showMyDialog(
  BuildContext context,
  String message, {
  DialogType type = DialogType.error,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: type == DialogType.error
          ? Colors.red
          : appcolor.primarycolor,
    ),
  );
}

showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: appcolor.darkcolor.withValues(alpha: .7),
    builder: (context) => Center(child: Lottie.asset(images.loadingJson, width: 150)),
  );
}