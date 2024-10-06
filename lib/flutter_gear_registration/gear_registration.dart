import 'package:flutter/material.dart';

class RegistrarEquipamentoScreen extends StatefulWidget {
  const RegistrarEquipamentoScreen({super.key});

  @override
  _RegistrarEquipamentoScreenState createState() => _RegistrarEquipamentoScreenState();
}

class _RegistrarEquipamentoScreenState extends State<RegistrarEquipamentoScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controladores dos campos de texto
  TextEditingController nomeController = TextEditingController();
  TextEditingController regiaoController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  TextEditingController dataCadastroController = TextEditingController();
  TextEditingController localizacaoController = TextEditingController();
  TextEditingController capacidadeController = TextEditingController();
  TextEditingController dataFabricacaoController = TextEditingController();
  TextEditingController numeroSerieController = TextEditingController();
  TextEditingController unidadeMedidaController = TextEditingController();
  TextEditingController predioController = TextEditingController();
  TextEditingController validadeController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Equipamento de Incêndio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              _buildTextField(nomeController, 'Nome'),
              _buildTextField(regiaoController, 'Região'),
              _buildTextField(descricaoController, 'Descrição'),
              _buildTextField(dataCadastroController, 'Data de Cadastro', keyboardType: TextInputType.datetime),
              _buildTextField(localizacaoController, 'Localização'),
              _buildTextField(capacidadeController, 'Capacidade', keyboardType: TextInputType.number),
              _buildTextField(dataFabricacaoController, 'Data de Fabricação', keyboardType: TextInputType.datetime),
              _buildTextField(numeroSerieController, 'Número de Série'),
              _buildTextField(unidadeMedidaController, 'Unidade de Medida'),
              _buildTextField(predioController, 'Prédio'),
              _buildTextField(validadeController, 'Validade', keyboardType: TextInputType.datetime),
              _buildTextField(statusController, 'Status'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Lógica para registrar o equipamento
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Equipamento registrado com sucesso!')));
                  }
                },
                child: const Text('Registrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText, {TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor, insira $labelText';
          }
          return null;
        },
      ),
    );
  }
}