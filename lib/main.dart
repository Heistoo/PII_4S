import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Certifique-se de ter o Riverpod instalado
import 'src/screens/login_screen.dart';
import 'src/screens/main_hub.dart';
import 'src/screens/equipment_hub.dart';

//Para o projeto, iremos utilizar da framework Riverpod para poder gerenciar os estados de autenticações de forma mais fácil e organizada.
//Como o projeto é grande e demasidamente complexo, precisamos gerenciar os componentes de forma eficiente trazendo eles globalmente entre as telas, evitando também a repetição de código e trazendo o acesso a estados através de um arquivo único.
//O riverpod separa a parte lógica do código da parte gráfica, fazendo com que os widgets só mostrem o que será exibido na tela, enquanto a parte lógica fica em outro arquivo, facilitando a manutenção do código.

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
