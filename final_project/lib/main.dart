import 'dart:async';
import 'package:final_project/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:alarm/alarm.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await Alarm.init(showDebugLogs: true);

  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: false),
      home: const MainScreen(),
    ),
  );
}
