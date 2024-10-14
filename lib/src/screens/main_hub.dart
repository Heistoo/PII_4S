import 'package:flutter/material.dart';

// ajuste da parte de cima 
class TopRoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    var controlPoint = Offset(size.width / 2, size.height);
    var endPoint = Offset(size.width, size.height - 50);
    path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
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

class MainHub extends StatelessWidget {
  const MainHub({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
            children: [
              ClipPath(
                clipper: TopRoundedClipper(),
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
                  color: Colors.white, // Fundo da parte inferior da tela
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        CustomElevatedButton(
                          text: 'Gerenciar Equipamento',
                          onPressed: () {},
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

