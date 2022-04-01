import 'package:dapur_aja/home.dart';
import 'package:dapur_aja/login.dart';
import 'package:dapur_aja/verify_email_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

class logHome extends StatelessWidget {
  const logHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          final user = FirebaseAuth.instance.currentUser;
          final isUserVerified = user?.emailVerified ?? false;
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              if (user != null) {
                if (user.emailVerified) {
                  print('verified');
                  print(user);
                } else {
                  return VerifyEmailView();
                }
              } else {
                return LoginView();
              }
              return HomePage();

              // if (isUserVerified) {
              //   print('Verified user');
              //   return HomeMobile();
              // } else {
              //   print('Not verified');
              //   print(user?.email ?? 'bruh');
              //   return VerifyEmailView();
              // }
              return LoginView();
            default:
              return Center(child: const CircularProgressIndicator());
          }
        });
  }
}

Widget snackBar(text) {
  return SnackBar(
    content: Text(text),
    width: 80,
    duration: Duration(milliseconds: 500),
  );
}
