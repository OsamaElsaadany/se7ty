import 'package:flutter/material.dart';
import 'package:se7ty/core/utils/colors.dart';

class tforwedg extends StatelessWidget {
  const tforwedg({super.key, required this.label, this.validator});

  final String label;
final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,      
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appcolor.graycolor),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appcolor.primarycolor),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appcolor.redcolor),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appcolor.redcolor),
          borderRadius: BorderRadius.circular(10),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appcolor.darkcolor),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
