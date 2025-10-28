import 'package:flutter/material.dart';
import 'package:se7ty/core/constants/assetsimages.dart';
import 'package:se7ty/core/utils/colors.dart';
import 'package:se7ty/core/utils/text_Styles.dart';
class welcome extends StatelessWidget {
  const welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            images.backgroundSvg,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),

          Positioned(
            bottom: 50,
            left: 30,
            right: 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset(
                //   // images.carrot,
                //   color: appcolor.whitecolor,
                //   colorBlendMode: BlendMode.srcIn,
                // ),
                SizedBox(height: 10),
                Text(
                  'Welcome \nto our store',
                  textAlign: TextAlign.center,
                  style: TextStyles.styleSize18.copyWith(
                    color: appcolor.whitecolor,
                    // fontsize: 48,
                  ),
                ),
                SizedBox(height: 19),
                Text(
                  'Ger your groceries in as fast as one hour',
                  
                  ),
                
                SizedBox(height: 40),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
