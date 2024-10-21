import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Certifique-se de ter o Riverpod instalado
import 'src/screens/login_screen.dart';
import 'src/screens/main_hub.dart';
import 'src/screens/equipment_hub.dart';

void main() {
  runApp(
    //function from riverpod framework para gerenciamento de estados globais
    ProviderScope( 
      child: const MyApp(),
    ),
  );
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
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/main_hub': (context) => const MainHub(),
        '/equipment_hub': (context) => EquipmentHub(),
      },
    );
  }
}
