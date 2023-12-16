import 'package:flutter/material.dart';
import 'RegistroProfesional.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Form',
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/trade-guide/840d3c8f28db369421144e41674806d4.jpg',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
               Transform.translate(
                  offset: Offset(90.0,-10.0), // Ajusta la posición aquí
                  child: Align(
                    alignment: Alignment.centerLeft,
                  child: Text(
                   'Bienvenidos',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                     fontFamily: 'Inter',
          fontSize: 29,
          fontWeight: FontWeight.w800,
          fontStyle: FontStyle.normal,
          color: Color.fromARGB(202, 0, 0, 0),
                    ),
                  ),
                ),
               ),
                SizedBox(height: 0.0),
             Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                       filled: true,
                      fillColor: const Color.fromARGB(230, 255, 255, 255),
                       labelStyle: TextStyle(color: Colors.black), // Color del texto del label
              
                     
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese un email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      border: OutlineInputBorder(),
                       filled: true,
                      fillColor: Color.fromARGB(232, 255, 255, 255),
                       labelStyle: TextStyle(color: Colors.black),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese una contraseña';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 5.0),
                   
                   TextButton(
                  onPressed: () {
                    // Aquí navegas a otro formulario para recuperar la contraseña
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegistroProfesional()),
                    );
                    
                  },
                  
                  child: RichText(
                    text: TextSpan(
                      text: '¿No estás registrado? ',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 18,
                       
                      ),
                      children: [
                        TextSpan(
                          text: 'Crear cuenta',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 243, 33, 33),
                            fontSize: 21,
                             decoration: TextDecoration.underline,
                          ),
                        ),
                       
                      ],
                    ),
                  ),
                   ),
                   
                    SizedBox(height: 5.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Perform login logic here
                        String email = _emailController.text;
                        String password = _passwordController.text;
                        print('Email: $email\nPassword: $password');
                      }
                    },
                    
                  style: ElevatedButton.styleFrom(
                   
    primary: Color.fromARGB(218, 62, 245, 117), // Cambia el color del botón aquí
    onPrimary: Color.fromARGB(255, 253, 253, 253), // Color del texto del botón
    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 25), // Ajusta el tamaño del botón
    textStyle: TextStyle(fontSize: 25), // Ajusta el tamaño del texto del botón
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30), // Ajusta el radio de borde del botón
    ),
  ),
  
  
                    child: Text('Entrar'),
                  ),
                    SizedBox(height: 5.0),
                TextButton(
                  onPressed: () {/*
                    // Aquí navegas a otro formulario para recuperar la contraseña
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
                    );
                    */
                  },
                  
                     child: RichText(
                    text: TextSpan(
                      text: '¿Olvidaste tu ',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 18,
                        decoration: TextDecoration.underline,
                      ),
                      
                      children: [
                        TextSpan(
                          text: 'contraseña ',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 243, 33, 33), // Cambia el color de "contraseña"
                            fontSize: 18,
                          ),
                        ),
                        TextSpan(
                          text: '?',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                ),
                ),
                ],
              
              ),
            ),
           
            ],
              )
          ),
        ],
      ),
    );
  }
}
