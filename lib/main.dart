// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'src/screens/login_screen.dart';
import 'src/screens/login_computer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(0, 20, 137, 100)),
        useMaterial3: true,
      ),
      home: LayoutBuilder(builder: (context, constraints){
        return constraints.maxWidth <= 768 ?
          LoginScreen() : LoginComputer();
      }),
    );
  }
}