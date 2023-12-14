//lib>LoginScreen
import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      // Aquí puedes agregar los campos de inicio de sesión
      body: cuerpo()
      
    );
  }
}


Widget cuerpo() {
  String imagePath = 'assets/trade-guide/fondoLogo.png';
  
  return Transform.translate(
    offset: Offset(0, -160), // Ajusta el valor según sea necesario para subir la imagen
    child: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Center(
        child: Column(
          children:  <Widget>[
            // Agrega aquí otros widgets si los necesitas
          ],
        ),
      ),
    ),
  );
}
