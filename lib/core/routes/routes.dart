

import 'package:go_router/go_router.dart';
import 'package:se7ty/features/onboarding/onboarding.dart';
import 'package:se7ty/features/splash/splashScreen.dart';

class Routes {
  static const String splash = '/';
  
  static const String welcome = '/welcome';
  static const String onboarding = '/Onboarding';
  static const String login = '/login';
  static const String register = '/register';
  

  static GoRouter route = GoRouter(
    routes: [
      GoRoute(path: splash, builder: (context, state) => const Splashscreen()),      
      GoRoute(path: onboarding, builder: (context, state) => const Onboarding()),      
    ],
  );
}