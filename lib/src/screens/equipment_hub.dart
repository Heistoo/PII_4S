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
        title: Text('METRÔ'),
      ),
      body: ListView.builder(
        itemCount: equipamentos.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/extintor.png', // Imagem do extintor
                        height: 50,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ID: ${equipamentos[index]['id']}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('Nome: ${equipamentos[index]['nome']}'),
                          Text('Status: OK'),
                          Text('Validade: 12/2025'),
                          Text('Última Manut: 10/2023'),
                        ],
                      ),
                    ],
                  ),
                  ButtonBar(
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
      ),
    );
  }
}
