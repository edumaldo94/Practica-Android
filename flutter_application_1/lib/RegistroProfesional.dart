import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegistroProfesional extends StatefulWidget {
  @override
  _RegistroProfesionalState createState() => _RegistroProfesionalState();
}

class _RegistroProfesionalState extends State<RegistroProfesional> {
  List<String> countries = []; // Lista de países obtenida de la API
  String? selectedCountry;
   List<String> provinces = [];// Lista de provincias obtenidas de la API
  String? selectedProvince;
   TextEditingController nombreController = TextEditingController();
  TextEditingController apellidoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController celularController = TextEditingController();
   TextEditingController ciudadController = TextEditingController();
  TextEditingController calleController = TextEditingController();
  TextEditingController contrasenaController = TextEditingController();
  TextEditingController oficioController = TextEditingController();


  Future<void> fetchCountries() async {
    /*
    final url = Uri.parse('https://restcountries.com/v2/all');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          countries = data.map<String>((country) => country['name']).toList();
        });
      } else {
        throw Exception('Failed to load countries');
      }
    } catch (error) {
      throw Exception('Failed to load countries: $error');
    }
    */

    try {
    // Lista de provincias de Argentina
    List<String> paisArgentina = [
      'Argentina',
      
    ];

    setState(() {
      countries = paisArgentina;
    });
  } catch (error) {
    throw Exception('Failed to load provinces: $error');
  }
  }

Future<void> fetchProvinces(String country) async {
  try {
    // Lista de provincias de Argentina
    List<String> provincesArgentina = [
      'Buenos Aires',
      'Catamarca',
      'Chaco',
      'Chubut',
      'Ciudad Autónoma de Buenos Aires',
      'Córdoba',
      'Corrientes',
      'Entre Ríos',
      'Formosa',
      'Jujuy',
      'La Pampa',
      'La Rioja',
      'Mendoza',
      'Misiones',
      'Neuquén',
      'Río Negro',
      'Salta',
      'San Juan',
      'San Luis',
      'Santa Cruz',
      'Santa Fe',
      'Santiago del Estero',
      'Tierra del Fuego, Antártida e Islas del Atlántico Sur',
      'Tucumán',
    ];

    setState(() {
      provinces = provincesArgentina;
    });
  } catch (error) {
    throw Exception('Failed to load provinces: $error');
  }
}

  @override
  void initState() {
    super.initState();
    fetchCountries(); // Cargar países al iniciar el widget
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro Profesional'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
               controller: nombreController,
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            TextFormField(
              controller: apellidoController,
              decoration: InputDecoration(labelText: 'Apellido'),
            ),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: celularController,
             
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(labelText: 'Celular'),
            ),
            DropdownButtonFormField<String>(

              value: selectedCountry,
              decoration: InputDecoration(labelText: 'País'),
             dropdownColor: Color.fromARGB(255, 255, 188, 44), // Opcional: define el color del menú desplegable
  isExpanded: true,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCountry = newValue;
                  provinces.clear();
                  selectedProvince = null;
                  fetchProvinces(newValue!);
                });
              },
              items: countries
                  .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: selectedProvince,
              decoration: InputDecoration(labelText: 'Provincia'),
               dropdownColor: Color.fromARGB(255, 255, 188, 44), // Opcional: define el color del menú desplegable
  isExpanded: true,
              onChanged: (String? newValue) {
                setState(() {
                  selectedProvince = newValue;
                });
              },
              items: provinces
                  .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ),
                  )
                  .toList(),
            ),
            TextFormField(
              controller: ciudadController,
             
              decoration: InputDecoration(labelText: 'Ciudad'),
            ),
             TextFormField(
              controller: calleController,
             
              decoration: InputDecoration(labelText: 'Calle'),
            ),
            TextFormField(
              obscureText: true,
              controller: contrasenaController,
              
              decoration: InputDecoration(labelText: 'Contraseña'),
            ),
            TextFormField(
              controller: oficioController,
             
              decoration: InputDecoration(labelText: 'Oficio'),

            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Lógica para guardar los datos del formulario
                  print('Nombre: ${nombreController.text}');
    print('Apellido: ${apellidoController.text}');
    print('Email: ${emailController.text}');
    print('Celular: ${celularController.text}');
    print('Pais seleccionada: $selectedCountry');
    print('Provincia seleccionada: $selectedProvince');
     print('Ciudad: ${ciudadController.text}');
    print('Calle: ${calleController.text}');
    print('Contraseña: ${contrasenaController.text}');
    print('Oficio: ${oficioController.text}');
              },
               style: ElevatedButton.styleFrom(
                   
    primary: Color.fromARGB(255, 255, 188, 44), // Cambia el color del botón aquí
    onPrimary: Color.fromARGB(255, 253, 253, 253), // Color del texto del botón
    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0), // Ajusta el tamaño del botón
    textStyle: TextStyle(fontSize: 25), // Ajusta el tamaño del texto del botón
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30), // Ajusta el radio de borde del botón
    ),
  ),
  
              child: Text('Registrar'),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
