import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:se7ty/core/utils/colors.dart';
import 'package:se7ty/core/utils/text_Styles.dart';

enum DialogType { error, success, warning }

showMyDialog(
  BuildContext context,
  String message, {
  DialogType type = DialogType.error,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(20),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: type == DialogType.error
          ? appcolor.redcolor
          : type == DialogType.success
          ? appcolor.primarycolor
          : appcolor.accentColor,
      content: Text(
        message,
        style: TextStyles.styleSize18.copyWith(color: appcolor.whitecolor),
      ),
    ),
  );
}

showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: appcolor.darkcolor.withValues(alpha: .7),
    builder: (context) {
      return Center(
        child: Lottie.asset("assets/images/loading.json", width: 250),
      );
    },
  );
}

