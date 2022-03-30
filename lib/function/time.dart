import 'package:flutter/material.dart';

String timeNow() {
  final time = DateTime.now().hour;

  if (time >= 18) {
    return "Malam ini  🌙";
  } else if (time >= 12) {
    return "Siang ini  🌞";
  } else {
    return "Pagi ini  🌅";
  }
}
