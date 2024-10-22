import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Simulação de usuários existentes
const users = {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

// Estado para gerenciamento de autenticações
class AuthNotifier extends StateNotifier<String?> {
  AuthNotifier() : super(null);

  Duration get loginTime => const Duration(milliseconds: 2250);

  // Autenticação do usuário
  Future<String?> authUser(LoginData data) async {
    await Future.delayed(loginTime);
    try {
      final response = await http.post(
        Uri.parse('http://localhost:5000/auth/login'), // URL da rota de login do backend
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': data.name,  // Enviando email
          'password': data.password,  // Enviando senha
        }),
      );

      if (response.statusCode == 200) {
        // Se o login for bem-sucedido, processa a resposta
        final responseBody = jsonDecode(response.body);
        state = data.name; // Armazena o email do usuário logado
        return null; // Retorna null se não houver erro
      } else {
        // Caso o backend retorne erro (ex: senha incorreta)
        final responseBody = jsonDecode(response.body);
        return responseBody['error'] ?? 'Erro ao fazer login';
      }
    } catch (e) {
      return 'Erro de conexão com o servidor';
    }
  }

  // Método para registrar um novo usuário
  Future<String?> signupUser(SignupData data) async {
    await Future.delayed(loginTime);
    
    // Lógica de requisição para o backend no Flask para criar o usuário
    try {
      final response = await http.post(
        Uri.parse('http://localhost:5000/auth/register'), // URL do backend
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': data.name,
          'password': data.password,
        }),
      );

      if (response.statusCode == 200) {
        // Se o registro for bem-sucedido
        return null;
      } else {
        // Caso o backend retorne algum erro (ex: email já registrado)
        final responseBody = jsonDecode(response.body);
        return responseBody['error'] ?? 'Erro ao registrar';
      }
    } catch (e) {
      return 'Erro de conexão com o servidor';
    }
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

// Provedor do AuthNotifier
final authNotifierProvider = StateNotifierProvider<AuthNotifier, String?>((ref) {
  return AuthNotifier();
});
