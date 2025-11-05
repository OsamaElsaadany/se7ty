import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:se7ty/core/constants/assetsimages.dart';
import 'package:se7ty/core/routes/navigator.dart';
import 'package:se7ty/core/routes/routes.dart';
import 'package:se7ty/core/services/local/shared_pref.dart';
import 'package:se7ty/core/utils/colors.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
     bool isOnboardingSeen = SharedPref.isOnboardingSeen();
    User? user = FirebaseAuth.instance.currentUser;
    Future.delayed(const Duration(seconds: 2), () {
      if (user != null) {
        if (user.photoURL == "doctor") {
          // pushWithReplacement(context, Routes.doctorMain);
        } else {
        }
      } else {
        if (isOnboardingSeen) {
          pushWithReplacement(context, Routes.welcome);
        } else {
          pushWithReplacement(context, Routes.onboarding);
        }
      }
    });
    super.initState();
  
    Future.delayed(Duration(seconds: 6), () {
      //context.go('/welcome');
      pushAndRemoveUntil(context, Routes.welcome);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appcolor.whitecolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset(images.logo, width: 300, height: 300)],
        ),
      ),
    );
  }
}
