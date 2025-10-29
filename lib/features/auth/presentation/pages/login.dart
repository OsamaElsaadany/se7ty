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

class Login extends StatefulWidget {
  const Login({super.key, required this.userType});
  final UserTypeEnum userType;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  bool isVisible = true;

  String handleUserType() {
    return widget.userType == UserTypeEnum.patient ? "مريض" : "دكتور";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appcolor.whitecolor,
        leading: const BackButton(color: appcolor.whitecolor),
      ),
      body: SingleChildScrollView(
        child: Form(
          //key: ,
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
                const SizedBox(height: 20.0),
                PasswordTextFormField(
                  controller: passwordController,
                  hintText: '********',
                  textAlign: TextAlign.left,
                  prefixIcon: const Icon(Icons.lock),
                  validator: (value) {
                    if (value!.isEmpty) return 'من فضلك ادخل كلمة السر';
                    return null;
                  },
                ),
                Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsetsDirectional.only(top: 10, start: 10),
                  child: Text(
                    'نسيت كلمة السر ؟',
                    style: TextStyles.styleSize14.copyWith(
                      color: appcolor.darkcolor,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                MainButton(
                  onPressed: () async {
                    // if (cubit.formKey.currentState!.validate()) {
                    //   cubit.login();
                    // }
                  },
                  text: "تسجيل الدخول",
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ليس لدي حساب ؟',
                        style: TextStyles.styleSize14.copyWith(
                          color: appcolor.darkcolor,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          pushWithReplacement(
                            context,
                            Routes.register,
                            extra: widget.userType,
                          );
                        },
                        child: Text(
                          'سجل الان',
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
