import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'features/app/splash_screen/splash_screen.dart';
import 'features/user_auth/presentation/pages/login_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDJrMvCiXd5Dfjwu1xkAjXRsAFyNeLkrng",
          appId: "1:139743567240:web:06619fc99b58641926ae3d",
          messagingSenderId: "G-R3S3H96E49",
          projectId: "tiziappp1"),
    );
  }
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Tizi",
      home: SplashScreen(
        child: LoginPage(),
      ),
    );
  }
}
