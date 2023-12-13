


import 'package:flutter/material.dart';

Widget cuerpo() {
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
        titulo()
      ]),
     ),
    );
  }

Widget titulo() {
  return RichText(
    text: TextSpan(
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w700,
        color: Colors.black, // Color del texto
      ),
      children: [
        TextSpan(text: "🅷"),
         TextSpan(text: "🅾",
         style: TextStyle(color: 
         const Color.fromARGB(255, 253, 17, 0),
         fontSize: 50)),
         TextSpan(text: "🅼"),
         TextSpan(text: "🅴"),
        TextSpan(text: "🆆"),
         TextSpan(text: "🅾",
         style: TextStyle(color: 
         const Color.fromARGB(255, 253, 17, 0),
         fontSize: 50)),
          TextSpan(text: "🆁"),
           TextSpan(text: "🅺"),
      ],
    ),
  );
}



