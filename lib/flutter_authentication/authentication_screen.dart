import 'package:flutter/material.dart';
import 'package:pii_4s/flutter_authentication/authentication_text_field.dart';
import 'package:pii_4s/style/wave.dart';

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