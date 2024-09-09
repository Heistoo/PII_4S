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
              AuthenticationTextFormField(
                icon: Icons.email,
                label: 'Email',
                textEditingController: emailHandler,
              ),
              AuthenticationTextFormField(
                icon: Icons.vpn_key,
                label: 'Password',
                textEditingController: passwordHandler,
              ),
              if (register == true)
              AuthenticationTextFormField(
                icon: Icons.password,
                label: 'Confirm your password',
                textEditingController: passwordConfirmationHandler,
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () {},
                child: Text(register == true ? 'Register' : "Login",
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
                  register == true ? 'Login here' : 'Register here',
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}