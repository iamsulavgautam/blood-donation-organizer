import 'package:flutter/material.dart';
import './screens/firstScreen.dart';

void main() {
  runApp(const RaktaApp());
}

class RaktaApp extends StatelessWidget {
  const RaktaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rakta',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.light,
        fontFamily: 'Roboto',
      ),
      home: const FirstScreen(),
    );
  }
}
