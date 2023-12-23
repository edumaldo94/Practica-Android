import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("uiyuiyu",
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),),
        backgroundColor: Color.fromRGBO(0, 0, 0, 0.87),
      ),
      body: Center(
       child: Form(child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          
             TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
           
                TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              
                TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
              ),
             
                
             
          ]
      ),
       ),
      ),
    );
  }
}

