import 'package:flutter/material.dart';
import 'package:se7ty/components/buttons/Mainbutton.dart';
import 'package:se7ty/components/inputs/custom_password_field.dart';
import 'package:se7ty/core/constants/assetsimages.dart';
import 'package:se7ty/core/helper/app_rejex.dart';
import 'package:se7ty/core/routes/navigator.dart';
import 'package:se7ty/core/routes/routes.dart';
import 'package:se7ty/core/utils/colors.dart';
import 'package:se7ty/core/utils/text_Styles.dart';
import 'package:se7ty/core/wedgits/custom.dart';
import 'package:se7ty/features/auth/models/User_type_enum.dart';

class Register extends StatefulWidget {
  const Register({super.key, required this.userType});
  final UserTypeEnum userType;

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isVisible = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  String handleUserType() {
    return widget.userType == UserTypeEnum.doctor ? 'دكتور' : 'مريض';
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appcolor.whitecolor,
        leading: const BackButton(color: appcolor.primarycolor),
      ),
      body:SingleChildScrollView(
          child: Form(
            
            child: Padding(
              padding: const EdgeInsets.only(right: 16, left: 16),
              child: Column(
                children: [
                 
                  Image.asset(images.logo, height: 250),
                  const SizedBox(height: 20),
                  Text(
                    'سجل دخول الان كـ "${handleUserType()}"',
                    style: TextStyles.styleSize22.copyWith(
                      color: appcolor.primarycolor,
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomTextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    hintText: 'اسم المستخدم',
                    textAlign: TextAlign.left,
                    prefixIcon: Icon(Icons.person),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'من فضلك ادخل الاسم';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 25.0),
                  CustomTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    hintText: 'Osama@example.com',
                    prefixIcon: Icon(Icons.email_rounded),
                    textAlign: TextAlign.end,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'من فضلك ادخل الايميل';
                      } else if (!AppRegex.isEmailValid(value)) {
                        return 'من فضلك ادخل الايميل صحيحا';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 25.0),
                  PasswordTextFormField(
                    controller: passwordController,
                    hintText: '********',
                    textAlign: TextAlign.left ,
                    prefixIcon: const Icon(Icons.lock),
                    validator: (value) {
                      if (value!.isEmpty) return 'من فضلك ادخل كلمة السر';
                      return null;
                    },
                  ),
                  const SizedBox(height: 20,),
                   MainButton(
                    onPressed: () async {
                      
                    },
                    text: "تسجيل حساب جديد",
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'لدي حساب ؟',
                          style: TextStyles.styleSize14.copyWith(
                            color: appcolor.darkcolor,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            pushWithReplacement(
                              context,
                              Routes.login,
                              extra: widget.userType,
                            );
                          },
                          child: Text(
                            'سجل دخول',
                            style: TextStyles.styleSize14.copyWith(
                              color: appcolor.primarycolor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }
}