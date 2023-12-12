import 'package:flutter/material.dart';

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
    ),
     body: ListView(
  children: <Widget>[
    Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Image.network(
            "https://www.ole.com.ar/images/2023/03/29/5FYMQ01hD_1290x760__1.jpg",
            // Aquí puedes agregar propiedades adicionales para la imagen si es necesario
          ),
          SizedBox(height: 10), // Espaciado entre la imagen y el título
          Text(
            'Título de la imagen 1',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
    Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[

           Text(
            'Título de la imagen 2',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image.network(
            "https://www.cronista.com/files/image/505/505950/63c82f6d65ed8.jpg",
            // Aquí puedes agregar propiedades adicionales para la imagen si es necesario
          ),
          SizedBox(height: 10), // Espaciado entre la imagen y el título
         
        ],
      ),
    ),
  ],
)
    );
}
}

