import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ty/core/routes/naviagtion.dart';
import 'package:se7ty/core/routes/routes.dart';
import 'package:se7ty/core/utils/colors.dart';
import 'package:se7ty/core/utils/text_Styles.dart';
import 'package:se7ty/features/patient/home/presentation/widgets/specialists_widget.dart';
import 'package:se7ty/features/patient/home/presentation/widgets/top_rated_widget.dart';

class PatientHomeScreen extends StatefulWidget {
  const PatientHomeScreen({super.key});

  @override
  State<PatientHomeScreen> createState() => _HomePageState();
}

class _HomePageState extends State<PatientHomeScreen> {
  final TextEditingController _doctorName = TextEditingController();
  User? user;

  Future<void> _getUser() async {
    user = FirebaseAuth.instance.currentUser;
  }

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_active,
              color: appcolor.darkcolor,
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        title: Text(
          'صــــــحّـتــي',
          style: TextStyles.styleSize22.copyWith(color: appcolor.darkcolor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'مرحبًا، ', style: TextStyles.styleSize18),
                    TextSpan(
                      text: user?.displayName ?? '',
                      style: TextStyles.styleSize22.copyWith(
                        color: appcolor.primarycolor,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(20),
              Text(
                "احجز الآن وكن جزءًا من رحلتك الصحية.",
                style: TextStyles.styleSize22.copyWith(
                  color: appcolor.darkcolor,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 20),

              Container(
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.3),
                      blurRadius: 15,
                      offset: const Offset(5, 5),
                    ),
                  ],
                ),
                child: TextFormField(
                  textInputAction: TextInputAction.search,
                  controller: _doctorName,
                  cursorColor: appcolor.primarycolor,
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                  decoration: InputDecoration(
                    hintStyle: TextStyles.styleSize18,
                    filled: true,
                    hintText: 'ابحث عن دكتور',
                    suffixIcon: Container(
                      decoration: BoxDecoration(
                        color: appcolor.primarycolor.withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: IconButton(
                        iconSize: 20,
                        splashRadius: 20,
                        color: Colors.white,
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          if (_doctorName.text.isNotEmpty) {
                            pushTo(
                              context,
                              Routes.homeSearch,
                              extra: _doctorName.text,
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  style: TextStyles.styleSize18,
                  onFieldSubmitted: (String value) {
                    if (_doctorName.text.isNotEmpty) {
                      pushTo(
                        context,
                        Routes.homeSearch,
                        extra: _doctorName.text,
                      );
                    }
                  },
                ),
              ),

              const SizedBox(height: 20),

              const SpecialistsBanner(),
              const SizedBox(height: 10),

              Text(
                "الأعلي تقييماً",
                textAlign: TextAlign.center,
                style: TextStyles.styleSize22.copyWith(fontSize: 16),
              ),
              const SizedBox(height: 10),
              const TopRatedList(),
            ],
          ),
        ),
      ),
    );
  }
}
