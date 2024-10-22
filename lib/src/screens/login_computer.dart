import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './main_computer.dart';
import './equipment_registration.dart';
import '../utils//auth_notifier.dart';

// apenas para teste de usuários, use para ir à tela principal
const users =  {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginComputer extends ConsumerWidget {
  const LoginComputer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //acesssa o provedor do AuthNotifier para sistema de login
    final authNotifier = ref.read(authNotifierProvider.notifier); 

    return Scaffold(
      body: Column(
        children: [
          AppBar(
            title: Image.asset('assets/imagens/Metro-SP_logo.png')
          ),
          Expanded(
            child: FlutterLogin(
              userType: LoginUserType.email,
              messages: LoginMessages(
                forgotPasswordButton: 'Esqueci a senha',
                signupButton: 'Registrar',
                recoverPasswordIntro: 'Recuperar senha',
                recoverPasswordDescription: 'Iremos enviar um email com informações para recuperar a senha',
                recoverPasswordButton: 'Recuperar',
                goBackButton: 'Voltar',
                confirmSignupSuccess: 'Registro feito com sucesso!',
              ),
              theme: LoginTheme(
                pageColorLight: Colors.white,
                pageColorDark: Colors.white,
              ),              
              onLogin: (loginData) => authNotifier.authUser(loginData),
              onSignup: (signupData) => authNotifier.signupUser(signupData),
              onSubmitAnimationCompleted: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const MainComp(),
                ));
              },
              onRecoverPassword: (name) => authNotifier.recoverPassword(name),
            ),
          ),
        ],
      ),
    );
  }
}