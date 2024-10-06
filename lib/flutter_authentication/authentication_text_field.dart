import 'package:flutter/material.dart';

class AuthenticationTextFormField extends StatelessWidget {
  const AuthenticationTextFormField({
    required this.icon,
    required this.label,
    required this.textEditingController,
    super.key,
  });

  final IconData icon;
  final String label;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return TextFormField(
      controller: textEditingController,
      obscureText: label.toLowerCase().contains('Senha'),
      decoration: InputDecoration(
        floatingLabelStyle: theme.textTheme.titleLarge,
        icon: Icon(icon, color: Color.fromRGBO(0, 20, 137, 1)),
        labelText: label,
      ),
    );
  }
}