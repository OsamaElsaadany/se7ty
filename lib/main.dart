import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // 👈 ضروري
import 'package:se7ty/core/routes/routes.dart';
import 'package:se7ty/core/services/local/shared_pref.dart';
import 'package:se7ty/core/utils/themes.dart';
import 'package:se7ty/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    await SharedPref.init();

  runApp(
    DevicePreview(
      enabled: !kReleaseMode, // عشان يشتغل في وضع الـ debug فقط
      builder: (context) => const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routes.routes,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,

      // 👇 أضف السطور دي:
      locale: const Locale('ar', 'EG'), // اللغة العربية (مصر)
      supportedLocales: const [Locale('ar', 'EG'), Locale('en', 'US')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      builder: (context, child) {
        // 👇 السطر اللي يعكس اتجاه الواجهة كلها
        return Directionality(textDirection: TextDirection.rtl, child: child!);
      },
    );
  }
}
