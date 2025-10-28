import 'package:flutter/material.dart';
import 'package:se7ty/core/utils/colors.dart';

class passforwid extends StatefulWidget {
  const passforwid({
    super.key,
    required this.label,
    // required this.ico,
    this.obs=false, this.validator,
  });

  final String label;
    final String? Function(String?)? validator;

  // final Widget? ico;
  final bool obs;

  @override
  State<passforwid> createState() => _passforwid();
}

class _passforwid extends State<passforwid> {


  bool obs =true; 
    @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      obscureText: obs,
      decoration: InputDecoration(
        labelText: widget.label,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              obs = !obs;
            });
          },
          icon:Icon(obs == true ? Icons.visibility : Icons.visibility_off,color: appcolor.graycolor,),
        ),
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
