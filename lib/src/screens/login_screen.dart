import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './main_hub.dart';
import '../utils//auth_notifier.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //acesssa o provedor do AuthNotifier para sistema de login
    final authNotifier = ref.read(authNotifierProvider.notifier); 

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 75,
            color: const Color.fromRGBO(0, 20, 137, 1),
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
              logo: const AssetImage('assets/imagens/Metro-SP_logo.png'),
              onLogin: (loginData) => authNotifier.authUser(loginData),
              onSignup: (signupData) => authNotifier.signupUser(signupData),
              onSubmitAnimationCompleted: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const MainHub(),
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
