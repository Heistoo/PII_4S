import 'package:flutter/material.dart';
import 'package:pii_4s/flutter_authentication/authentication_text_field.dart';
import 'package:pii_4s/style/wave.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final emailHandler = TextEditingController();
  final passwordHandler = TextEditingController();
  final passwordConfirmationHandler = TextEditingController();
  bool register = true;

  Future<void> _register() async {
    final url = Uri.parse('http://localhost:5000/register'); // substitua pela URL do seu backend
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'email': emailHandler.text,
        'password': passwordHandler.text,
      }),
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(data['message'])),
      );
      // Redirecionar ou limpar o formulário após o registro
      _formKey.currentState?.reset();
    } else {
      final data = jsonDecode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(data['message'])),
      );
    }
  }

  Future<void> _login() async {
    final url = Uri.parse('http://localhost:5000/login'); // substitua pela URL do seu backend
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'email': emailHandler.text,
        'password': passwordHandler.text,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(data['message'])),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login falhou')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              // const SizedBox(height: 50),
              const Wave(),
              Image.asset(
              'assets/imagens/Metro-SP.png',
              fit: BoxFit.contain,
            ),
              AuthenticationTextFormField(
                icon: Icons.email,
                label: 'Email',
                textEditingController: emailHandler,
              ),
              AuthenticationTextFormField(
                icon: Icons.vpn_key,
                label: 'Senha',
                textEditingController: passwordHandler,
              ),
              if (register == true)
              AuthenticationTextFormField(
                icon: Icons.password,
                label: 'Confirmar Senha',
                textEditingController: passwordConfirmationHandler,
              ),
              SizedBox(height: 25),
              if (register == false)
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [Checkbox(value: false, onChanged: (bool? value) { value!; }), Text('Lembrar de mim'), Text("                    Esqueceu sua senha?", style: TextStyle(color: Color.fromRGBO(2, 92, 196, 1)), )]),
              const SizedBox(height: 25),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Color.fromRGBO(0, 20, 137, 1),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/registrar');
                  if (register) {
                    _register(); // Chama a função de registro
                  } else {
                    _login(); // Chama a função de login
                  }
                },
                child: Text(register == true ? 'Cadastre-se' : "Login",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white,),
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  setState(() => register = !register);
                  _formKey.currentState?.reset();
                },
                child: Text(
                  register == true ? 'Já possui uma conta?' : 'Ainda não fez seu cadastro?',
                  ),
              ),
              SizedBox(height: 40),
              const Text("Todos os direitos reservados ao Metrô do governo de São Paulo"),
            ],
          ),
        ),
      ),
    );
  }
}