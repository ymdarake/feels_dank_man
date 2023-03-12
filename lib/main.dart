import 'package:feels_dank_man/app.dart';
import 'package:feels_dank_man/di/container.dart' as di;
import 'package:flutter/material.dart';

void main() {
  // TODO: setup crashlytics and etc
  di.setup();
  runApp(const MyApp());
}
