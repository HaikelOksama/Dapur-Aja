import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

class logHome extends StatelessWidget {
  const logHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: FutureBuilder(
          future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          ),
          builder: (context, snapshot) {
            final user = FirebaseAuth.instance.currentUser;
            var isUserVerified = user?.emailVerified ?? false;
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                if (isUserVerified) {
                  print('Verified user');
                  print(user?.email ?? 'bruh');
                } else {
                  print('Not verified');
                  print(user?.email ?? 'bruh');
                }
                return CircleAvatar(child: Image.network(user?.photoURL ?? ''));
              default:
                return Center(child: const Text('Loading...'));
            }
          }),
    );
  }
}
