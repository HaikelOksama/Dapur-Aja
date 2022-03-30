import 'package:dapur_aja/logHome.dart';
import 'package:dapur_aja/login.dart';
import 'package:dapur_aja/register.dart';
import 'package:flutter/material.dart';
import 'package:dapur_aja/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const DapurAja());
}

class AppColor {
  MaterialColor primary = Colors.teal;
}

class DapurAja extends StatelessWidget {
  const DapurAja({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dapur Aja",
      theme: ThemeData(primarySwatch: Colors.teal, fontFamily: 'Montserrat'),
      home: logHome(),
    );
  }
}
