import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:se7ty/features/auth/models/User_type_enum.dart';
import 'package:se7ty/features/auth/models/doctor_model.dart';
import 'package:se7ty/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:se7ty/features/auth/presentation/pages/complete_registeration_doctor.dart';
import 'package:se7ty/features/auth/presentation/pages/login.dart';
import 'package:se7ty/features/auth/presentation/pages/register.dart';
import 'package:se7ty/features/intro/onboarding/onboarding.dart';
import 'package:se7ty/features/intro/splash/splashScreen.dart';
import 'package:se7ty/features/intro/welcome/pages/welcome.dart';
import 'package:se7ty/features/patient/home/presentation/page/home_search_screen.dart';
import 'package:se7ty/features/patient/home/presentation/page/specialization_search_screen.dart';
import 'package:se7ty/features/patient/main/nav_bar.dart';
import 'package:se7ty/features/patient/search/page/doctor_profile_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class Routes {
  static const String splashScreen = '/';
  static const String onboarding = '/onboarding';
  static const String welcome = '/welcome';
  static const String login = '/LoginScreen';
  static const String register = '/register';
  static const String doctorRegistration = '/doctorRegistration';
  static const String patientMain = '/patientMain';
  static const String specializationSearch = '/specializationSearch';
  static const String homeSearch = '/homeSearch';
  static const String doctorProfile = '/doctorProfile';

  static GoRouter routes = GoRouter(
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        path: splashScreen,
        builder: (context, state) => const Splashscreen(),
      ),
      GoRoute(
        path: onboarding,
        builder: (context, state) => const Onboarding(),
      ),
      GoRoute(
        path: welcome,
        builder: (context, state) => const Welcome(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: LoginScreen(userType: state.extra as UserTypeEnum),
        ),
      ),
      GoRoute(
        path: register,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: Register(userType: state.extra as UserTypeEnum),
        ),
      ),
      GoRoute(
        path: doctorRegistration,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: DoctorRegistrationScreen(),
        ),
      ),
      GoRoute(
        path: patientMain,
        builder: (context, state) => PatientMainAppScreen(),
      ),
      GoRoute(
        path: specializationSearch,
        builder: (context, state) =>
            SpecializationSearchScreen(specialization: state.extra as String),
      ),
      GoRoute(
        path: homeSearch,
        builder: (context, state) =>
            HomeSearchScreen(searchKey: state.extra as String),
      ),
      GoRoute(
        path: doctorProfile,
        builder: (context, state) =>
            DoctorProfileScreen(doctorModel: state.extra as DoctorModel),
      ),
    ],
  );

}
