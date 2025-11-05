import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:se7ty/features/auth/models/User_type_enum.dart';
import 'package:se7ty/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:se7ty/features/auth/presentation/pages/complete_registeration_doctor.dart';
import 'package:se7ty/features/auth/presentation/pages/login.dart';
import 'package:se7ty/features/auth/presentation/pages/register.dart';
import 'package:se7ty/features/intro/onboarding/onboarding.dart';
import 'package:se7ty/features/intro/splash/splashScreen.dart';
import 'package:se7ty/features/intro/welcome/pages/welcome.dart';

class Routes {
  static const String splash = '/';

  static const String onboarding = '/Onboarding';
  static const String welcome = '/Welcome';
  static const String login = '/Login';
  static const String register = '/Register';
  static const String doctorRegistration = '/doctorRegistration';

  static GoRouter route = GoRouter(
    routes: [
      GoRoute(path: splash, builder: (context, state) => const Splashscreen()),
      GoRoute(
        path: onboarding,
        builder: (context, state) => const Onboarding(),
      ),
      GoRoute(path: welcome, builder: (context, state) => const Welcome()),
      GoRoute(
        path: login,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: Login(userType: state.extra as UserTypeEnum),
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
    ],
  );
}
