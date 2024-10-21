import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_login/flutter_login.dart';

// Simulação de usuários existentes
const users = {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};
//estado para gerenciamento de autenticações (pode ser utilizado na tela de login do computador!)
class AuthNotifier extends StateNotifier<String?> {
  AuthNotifier() : super(null);

  Duration get loginTime => const Duration(milliseconds: 2250);

//autenticação do usuário
  Future<String?> authUser(LoginData data) async {
    await Future.delayed(loginTime);
    if (!users.containsKey(data.name)) {
      return 'Usuário não existe';
    }
    if (users[data.name] != data.password) {
      return 'Senha incorreta';
    }
    state = data.name; // armazenamos o nome do usuário.
    return null;
  }

  // Método para registrar um novo usuário
  Future<String?> signupUser(SignupData data) async {
    await Future.delayed(loginTime);
    // Lógica de registro aqui (pode adicionar na lista de usuários, exemplo)
    return null;
  }

  // Método para recuperar a senha
  Future<String?> recoverPassword(String name) async {
    await Future.delayed(loginTime);
    if (!users.containsKey(name)) {
      return 'Usuário não existe';
    }
    return null;
  }
}

// Provedor do AuthNotifier novamente
final authNotifierProvider = StateNotifierProvider<AuthNotifier, String?>((ref) {
  return AuthNotifier();
});
