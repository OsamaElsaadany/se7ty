import 'package:flutter/material.dart';
import 'package:se7ty/core/constants/assetsimages.dart';
import 'package:se7ty/core/routes/navigator.dart';
import 'package:se7ty/core/routes/routes.dart';
import 'package:se7ty/core/utils/colors.dart';
import 'package:se7ty/core/utils/text_Styles.dart';
import 'package:se7ty/features/auth/models/User_type_enum.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            images.background,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),

          PositionedDirectional(
            top: 100,
            start: 25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'اهلا بيك',
                  style: TextStyles.styleSize30.copyWith(
                    fontSize: 38,
                    color: appcolor.primarycolor,
                  ),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 15),
                Text(
                  'سجل واحجز عند دكتورك وانت فالبيت',
                  style: TextStyles.styleSize18.copyWith(
                    color: appcolor.darkcolor,
                  ),
                ),
              ],
            ),
          ),
          PositionedDirectional(
            bottom: 80,
            start: 25,
            end: 25,
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: appcolor.primarycolor.withValues(alpha: .5),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: appcolor.graycolor.withValues(alpha: .3),
                    blurRadius: 15,
                    offset: Offset(5, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'سجل دلوقتى ك ',
                    style: TextStyles.styleSize18.copyWith(
                      color: appcolor.whitecolor,
                    ),
                  ),
                  SizedBox(height: 20),
                  _builduserButton(
                    title: 'دكتور',
                    onTap: () {
                      pushTo(context, Routes.login, extra: UserTypeEnum.doctor);
                    },
                  ),
                  SizedBox(height: 15),
                  _builduserButton(
                    title: 'مريض',
                    onTap: () {
                      pushTo(
                        context,
                        Routes.login,
                        extra: UserTypeEnum.patient,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

GestureDetector _builduserButton({
  required String title,
  required Function() onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 70,
      decoration: BoxDecoration(
        color: appcolor.whitecolor.withValues(alpha: .7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyles.styleSize18.copyWith(
            color: appcolor.darkcolor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
