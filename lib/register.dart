import 'package:flutter/material.dart';

import 'package:dapur_aja/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Center(
        child: Container(
          width: 350,
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email ',
                ),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                enableSuggestions: false,
                controller: _email,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Password '),
                obscureText: true,
                autocorrect: false,
                enableSuggestions: false,
                controller: _password,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    final email = _email.text;
                    final password = _password.text;
                    final userCredential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: email, password: password);
                    print(userCredential);
                  },
                  child: Text('Register')),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/login/', (route) => false);
                  },
                  child: Text('Already registered? Login here'))
            ],
          ),
        ),
      ),
    );
  }
}
