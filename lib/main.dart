import 'package:feels_dank_man/app.dart';
import 'package:feels_dank_man/di/container.dart' as di;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (kDebugMode) {
    // debugPaintSizeEnabled = true;
  }
  // TODO: setup crashlytics and etc
  di.setup();

  runApp(const MyApp());
}
