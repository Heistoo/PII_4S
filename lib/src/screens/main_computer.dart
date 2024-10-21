import 'package:flutter/material.dart';
import 'equipment_registration.dart';

class CustomClipperTop extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    double w = size.width;
    double h = size.height;
    final path = Path();
    path.lineTo(0, h);
    path.quadraticBezierTo(
      w * 0.5,
      h - 100,
      w,
      h
      );
    path.lineTo(w, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(0, 20, 137, 1), // Azul escuro
        minimumSize: Size(double.infinity, 50), // Largura total
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class MainComp extends StatelessWidget {
  const MainComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
            children: [
              ClipPath(
                clipper: CustomClipperTop(),
                child: Container(
                  height: 150, // Altura da área superior
                  color: const Color.fromRGBO(0, 20, 137, 1), // Azul escuro
                ),
              ),
              Container(
                child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset(
                        'assets/imagens/Metro-SP_logo.png',
                        width: 200, // Tamanho do logotipo
                      ),
                    ),
                  ),
              ),
              Expanded(
                child: Container(
                  constraints: BoxConstraints(maxWidth: 800),
                  color: const Color.fromARGB(0, 255, 255, 255), // Fundo da parte inferior da tela
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        CustomElevatedButton(
                          text: 'Gerenciar Equipamento',
                          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrarEquipamentoScreen()));},
                        ),
                        SizedBox(height: 16), // Espaçamento entre os botões
                        CustomElevatedButton(
                          text: 'Relatórios',
                          onPressed: () {},
                        ),
                        SizedBox(height: 16), // Espaçamento entre os botões
                        CustomElevatedButton(
                          text: 'Sobre',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
      )
    );
  }
}