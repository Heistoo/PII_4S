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
      h - 150,
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
        backgroundColor: const Color.fromRGBO(0, 20, 137, 1), 
        minimumSize: Size(double.infinity, 50), 
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
                clipper: CustomClipperTop(),
                child: Container(
                  height: 150,
                  color: const Color.fromRGBO(0, 20, 137, 1),
                ),
              ),
              Container(
                child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset(
                        'assets/imagens/Metro-SP_logo.png',
                        width: 200,
                      ),
                    ),
                  ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        CustomElevatedButton(
                          text: 'Gerenciar Equipamento',
                          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrarEquipamentoScreen()));},
                        ),
                        SizedBox(height: 16),
                        CustomElevatedButton(
                          text: 'Relatórios',
                          onPressed: () {},
                        ),
                        SizedBox(height: 16),
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