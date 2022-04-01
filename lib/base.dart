import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

class Base extends StatefulWidget {
  const Base({Key? key}) : super(key: key);

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main'),
      ),
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
                  print(user);
                } else {}
                return CircleAvatar(child: Image.network(user?.photoURL ?? ''));
              default:
                return Center(child: const Text('Loading...'));
            }
          }),
    );
  }
}
