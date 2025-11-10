import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:se7ty/components/buttons/Mainbutton.dart';
import 'package:se7ty/core/routes/naviagtion.dart';
import 'package:se7ty/core/routes/routes.dart';
import 'package:se7ty/core/services/local/shared_pref.dart';
import 'package:se7ty/core/utils/colors.dart';
import 'package:se7ty/core/utils/text_Styles.dart';
import 'package:se7ty/features/intro/onboarding/onboardingmodel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  var Pagecontroller = PageController();
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          if (currentindex != onboardinglist.length - 1)
            TextButton(
              onPressed: () {
                SharedPref.setOnboardingSeen();
                pushWithReplacement(context, Routes.welcome);
              },
              child: Text(
                'تخطى',
                style: TextStyles.styleSize18.copyWith(
                  color: appcolor.primarycolor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: Pagecontroller,
                onPageChanged: (index) {
                  setState(() {
                    currentindex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Spacer(flex: 2),
                      SvgPicture.asset(
                        onboardinglist[index].imagePath,
                        width: MediaQuery.sizeOf(context).width * .8,
                      ),
                      Spacer(flex: 1),
                      Text(
                        onboardinglist[index].title,
                        style: TextStyles.styleSize24,
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text(
                          onboardinglist[index].description,
                          style: TextStyles.styleSize14.copyWith(
                            color: appcolor.darkcolor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Spacer(flex: 3),
                    ],
                  );
                },
                itemCount: onboardinglist.length,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 10,
              ),
              height: 65,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(
                    controller: Pagecontroller,
                    count: onboardinglist.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: appcolor.primarycolor,
                      dotColor: appcolor.graycolor,
                      dotHeight: 10,
                      dotWidth: 10,
                    ),
                  ),
                  if (currentindex == onboardinglist.length - 1)
                    MainButton(
                      text: 'هيا بنا',
                      onPressed: () {
                        pushWithReplacement(context, Routes.welcome);
                      },
                      width: 100,
                      height: 45,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
