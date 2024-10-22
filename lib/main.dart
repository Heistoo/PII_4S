import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Certifique-se de ter o Riverpod instalado
import 'package:pii_4s/src/screens/login_computer.dart';
import 'package:pii_4s/src/screens/main_computer.dart';
import 'src/screens/login_screen.dart';
import 'src/screens/main_hub.dart';
import 'src/screens/equipment_hub.dart';
import 'src/screens/equipment_registration.dart';

//Para o projeto, iremos utilizar da framework Riverpod para poder gerenciar os estados de autenticações de forma mais fácil e organizada.
//Como o projeto é grande e demasidamente complexo, precisamos gerenciar os componentes de forma eficiente trazendo eles globalmente entre as telas, evitando também a repetição de código e trazendo o acesso a estados através de um arquivo único.
//O riverpod separa a parte lógica do código da parte gráfica, fazendo com que os widgets só mostrem o que será exibido na tela, enquanto a parte lógica fica em outro arquivo, facilitando a manutenção do código.

void main() {
  runApp(
    //function from riverpod framework para gerenciamento de estados globais
    const ProviderScope( 
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(0, 20, 137, 100)),
        // useMaterial3: true,
      // ),
      initialRoute: '/initial',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/main_hub': (context) => const MainHub(),
        '/equipment_hub': (context) => EquipmentHub(),
        '/loginC' : (context) => const LoginComputer(),
        '/main_hubC':(context) => const MainComp(),
        '/equipment_registration':(context) => const RegistrarEquipamentoScreen(),
        '/initial': (context) => Decide(),
      },
    );
  }
}

class Decide extends StatelessWidget {
  const Decide({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return constraints.maxWidth <= 768? const LoginScreen() : const LoginComputer();
      },
    );
  }
}
