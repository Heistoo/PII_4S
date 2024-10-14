import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

const users =  {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return '';
    });
  }
  
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Column(
      children: [
        Container(
          width: double.infinity,
          height: 75,
          color: const Color.fromRGBO(0, 20, 137, 1),
        ),
        // FlutterLogin widget
        Expanded(
          child: FlutterLogin(
            theme: LoginTheme(
              pageColorLight: Colors.white,
              pageColorDark: Colors.white,
            ),
            logo: const AssetImage('assets/imagens/Metro-SP_logo.png'),
            onLogin: _authUser,
            onSignup: _signupUser,
            onRecoverPassword: _recoverPassword,
          ),
        ),
      ],
    ),
  );
  }
}