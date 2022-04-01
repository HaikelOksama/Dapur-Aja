import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Verify Email')),
      body: Column(
        children: [
          Text('Please verify your email'),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () async {
                final user = FirebaseAuth
                    .instance.currentUser; //get Current User as Variable
                await user?.sendEmailVerification();
              },
              child: Text('Send email verification'))
        ],
      ),
    );
  }
}
