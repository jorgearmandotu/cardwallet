import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './ui/app.dart';

void main() => SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_){ runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData.light(),
  home: App(),
));});