
import 'package:flutter/material.dart';

import 'LoginScreen.dart';
import 'RegistroProfesional.dart';
void main() {
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"My App",
      home: Home(),
    );
  }
}


class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
          title: Text("My app"),
          backgroundColor: Color.fromARGB(169, 226, 3, 77),
    
    ),
     body: cuerpo(context)
    );
}
}


Widget cuerpo(BuildContext context) {
    String imagePath = 'assets/trade-guide/840d3c8f28db369421144e41674806d4.jpg';
  
    return Container(
      
      decoration: BoxDecoration(
        image: DecorationImage(
        
          image: AssetImage(imagePath),
          fit: BoxFit.fitHeight,
      alignment: Alignment(-0.7, 0.9)
        ),
      ),
     child: Center(
      child: Column(
        children:  <Widget> [
        titulo(),
        subtitulo(),
      //  campoUser(),
        btnLogin(context),
        noCuenta(context)

      ]),
     ),
    );
  }


Widget titulo() {

   double fem = 10.0;
  double ffem = 10.0;
  return Transform.translate(
    offset: Offset(0.0, 90.0), // Mueve el texto 50 unidades hacia abajo (ajusta el valor según tu preferencia)
    child: Transform(
      transform: Matrix4.rotationZ(-0.3), // Cambia el ángulo según sea necesario
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w300,
            fontFamily: 'Inter',
             color: Color(0xef242424),
              height: 1.2125 * ffem / fem,
          ),
          
          children: [
           
            TextSpan(text: "🅷"),
            TextSpan(
              text: "🅾",
              style: TextStyle(
                color: const Color.fromARGB(255, 253, 17, 0),
                fontSize: 50,
                
              ),
            ),
            TextSpan(text: "🅼"),
            TextSpan(text: "🅴"),
            TextSpan(text: "🆆"),
            TextSpan(
              text: "🅾",
              style: TextStyle(
                color: const Color.fromARGB(255, 253, 17, 0),
                fontSize: 50,
            
              ),
            ),
            TextSpan(text: "🆁"),
            TextSpan(text: "🅺"),
          ],
        ),
      ),
    ),
  );
}

Widget subtitulo() {
  return Transform.translate(
    offset: Offset(100.0, 150.0), // Cambia estos valores para ajustar la posición
    child: Container(
      constraints: BoxConstraints(maxWidth: 197),
      child: Text(
        '¿Tenés \nel número\n de un ..?',
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 40,
          fontWeight: FontWeight.w800,
          fontStyle: FontStyle.italic,
          color: Color.fromARGB(118, 0, 0, 0),
        ),
      ),
    ),
  );
}

Widget btnLogin(BuildContext context) {
  return Transform.translate(
    offset: Offset(0.0, 330.0),
    child: TextButton(
      onPressed: () {
  // Navegar a la pantalla de inicio de sesión
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },
      child: Container(
        width: 250,
        height: 59,
        decoration: BoxDecoration(
          color: Color(0xe0bbfaff),
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Color(0x3f000000),
              offset: Offset(0, 4),
              blurRadius: 2,
            ),
          ],
        ),
        child: Center(
          child: Text(
            'Iniciar',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 24,
              fontWeight: FontWeight.w300,
              color: Color(0xff000000),
            ),
          ),
        ),
      ),
    ),
  );
}


Widget noCuenta(context){

  return Transform.translate(offset: Offset(0.0,340.0),
  child: TextButton(
      onPressed: () {
        // Aquí va tu lógica al presionar el botón
 Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegistroProfesional()),
                    );
      },
  child: Container(
          margin: EdgeInsets.fromLTRB(0 , 0, 15 , 0 ),
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 24 ,
                fontWeight: FontWeight.w400,
                height: 1.2125 ,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              children: [
                TextSpan(text: 'Si no tenes una cuenta, '),
                TextSpan(
                  text: 'registrate',
                  style: TextStyle(
                    fontSize: 24 ,
                    fontWeight: FontWeight.w300,
                    height: 1.2125  ,
                    decoration: TextDecoration.underline,
                    color: Color(0xffff0000),
                    decorationColor: Color(0xffff0000),
                  ),
                ),
              ],
            ),
          ),
        ),
  ),
  );
}
