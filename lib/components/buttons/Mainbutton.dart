import 'package:flutter/material.dart';
import 'package:se7ty/core/utils/colors.dart';
import 'package:se7ty/core/utils/text_Styles.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height = 55,
    this.width = double.infinity,
    this.margin = EdgeInsets.zero,
    this.bgColor = appcolor.primarycolor,
    this.borderColor,
    this.textColor,
  });
  final String text;
  final Function() onPressed;
  final double height;
  final double width;
  final EdgeInsetsGeometry margin;
  final Color bgColor;
  final Color? borderColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          side: borderColor != null
              ? BorderSide(color: borderColor ?? appcolor.darkcolor)
              : BorderSide.none,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyles.styleSize14.copyWith(
            color: textColor ?? appcolor.whitecolor,
          ),
        ),
      ),
    );
  }
}