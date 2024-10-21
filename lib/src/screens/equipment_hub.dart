import 'package:flutter/material.dart';

class EquipmentHub extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Equipamentos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EquipamentosPage(),
    );
  }
}

class EquipamentosPage extends StatelessWidget {
  final List<Map<String, String>> equipamentos = [
    {'id': '001', 'nome': 'Extintor A'},
    {'id': '002', 'nome': 'Extintor B'},
    {'id': '003', 'nome': 'Extintor C'},
    {'id': '004', 'nome': 'Extintor D'},
    {'id': '005', 'nome': 'Extintor E'},
    {'id': '006', 'nome': 'Extintor F'},
  ];

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Image.asset(
        'assets/imagens/Metro-SP_logo.png',
        height: 50,
      ),
    ),
    body: LayoutBuilder(
      builder: (context, constraints) {
        // Define o número de colunas com base na largura da tela
        int crossAxisCount = (constraints.maxWidth ~/ 200).toInt(); 
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount, 
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 1.0, 
          ),
          itemCount: equipamentos.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center, 
                  children: [
                    Image.asset(
                      'assets/imagens/extintor.png',
                      height: 50,
                    ),
                    SizedBox(height: 8),  // Espaçamento entre imagem e informações
                    Text(
                      'ID: ${equipamentos[index]['id']}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Nome: ${equipamentos[index]['nome']}'),
                    Text('Status: OK'),
                    Text('Validade: 12/2025'),
                    Text('Última Manut: 10/2023'),
                    Spacer(), 
                    OverflowBar(
                      alignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Ação ao clicar em "Info Detalhadas"
                          },
                          child: Text('Info Detalhadas'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Ação ao clicar em "Editar Equip"
                          },
                          child: Text('Editar Equip'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    ),
  );
}
}
