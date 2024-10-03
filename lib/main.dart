import 'package:flutter/material.dart';
import 'package:pii_4s/flutter_authentication/authentication_screen.dart';
import 'package:pii_4s/flutter_gear_registration/gear_registration.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),
      home: const AuthenticationScreen(),
      routes: {
        '/registrar': (context) => RegistrarEquipamentoScreen(), // Rota para a tela de registrar
      },
    );
  }
}