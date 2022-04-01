import 'package:dapur_aja/logHome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
      appBar: AppBar(
        title: Text('Login'),
      ),
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
                    try {
                      final userCredential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: email, password: password);
                      // await Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => logHome(),
                      //     ));
                      print(userCredential);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        print('User Not Found');
                      } else {
                        print('username or password is wrong');
                      }
                    }
                  },
                  child: Text('Login')),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/register/', (route) => false);
                  },
                  child: Text('Not have an Account? Register now'))
            ],
          ),
        ),
      ),
    );
  }
}
