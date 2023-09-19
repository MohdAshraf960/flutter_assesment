import 'package:currency/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'injector/injector.dart';

void main() async {
  await init();
  runApp(const AppModule());
}

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injector();
  await dotenv.load();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}
