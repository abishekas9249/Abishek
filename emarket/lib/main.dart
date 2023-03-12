import 'package:emarket/Screens/sign_in_screen.dart';
import 'package:emarket/layouts/screen_layout.dart';
import 'package:emarket/utils/color_themes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
      apiKey: "AIzaSyAyMh7NC-giAK2nFdJz7AIn6nuE6nimVB0",
      authDomain: "clone-dbab0.firebaseapp.com",
      projectId: "clone-dbab0",
      storageBucket: "clone-dbab0.appspot.com",
      messagingSenderId: "131476447115",
      appId: "1:131476447115:web:298e809c2a3826c7ce198e",
    ));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Amazon Clone",
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: backgroundColor,
        ),
        themeMode: ThemeMode.light,
        home: SafeArea(
          child: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, AsyncSnapshot<User?> user) {
                if (user.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(color: Colors.orange),
                  );
                } else if (user.hasData) {
                  return ScreenLayout();
                } else {
                  return SignInScreen();
                }
              }),
        ));
  }
}
