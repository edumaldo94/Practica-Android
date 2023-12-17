import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//import 'dart:convert';

class RegistroProfesional extends StatefulWidget {
  @override
  _RegistroProfesionalState createState() => _RegistroProfesionalState();
}

class _RegistroProfesionalState extends State<RegistroProfesional> {
  bool acceptedTerms = false;
  List<String> countries = []; // Lista de países obtenida de la API
  String? selectedCountry;
   List<String> provinces = [];// Lista de provincias obtenidas de la API
  String? selectedProvince;
 List<String> profesiones = [
    'Profesión 1',
    'Profesión 2',
    'Profesión 3',
    // ... Agrega más profesiones aquí
  ];
  List<String> selectedProfesiones = [];// Lista de profesiones seleccionadas

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

 // Método para mostrar un diálogo con los términos y condiciones
  Future<void> _mostrarTerminosCondiciones() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Términos y Condiciones'),
          content: SingleChildScrollView(
            child: Text(
              '''
1. Aceptación de los Términos y Condiciones:\n
Estos términos y condiciones regulan el uso del servicio ofrecido por nuestra aplicación.\n
2. Uso del Servicio:\n
Al usar nuestra aplicación, aceptas cumplir con estos términos y condiciones.\n
3. Modificaciones:\n
Nos reservamos el derecho de modificar, actualizar o reemplazar cualquier parte de estos términos y condiciones.\n
4. Limitaciones de Responsabilidad:\n
No nos responsabilizamos por el uso indebido del servicio.\n
5. Contacto:\n
Si tienes alguna pregunta sobre estos términos y condiciones, contáctanos.
'''

              // Coloca aquí tu texto con los términos y condiciones de la app
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cerrar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  @override
  void initState() {
    super.initState();
    fetchCountries(); // Cargar países al iniciar el widget
 
  }



  // Resto del código

  Future<void> _mostrarDialogoProfesiones() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Selecciona tus profesiones'),
          content: SingleChildScrollView(
            child: Column(
              children: profesiones.map((String profesion) {
                return CheckboxListTile(
                  title: Text(profesion),
                  value: selectedProfesiones.contains(profesion),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value != null && value) {
                        selectedProfesiones.add(profesion);
                      } else {
                        selectedProfesiones.remove(profesion);
                      }
                    });
                  },
                );
              }).toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
        ElevatedButton(
              onPressed: () {
                _mostrarDialogoProfesiones();
              },
              child: Text('Seleccionar profesiones'),
            ),
                  SizedBox(height: 15.0),
Row(
  children: [
    Checkbox(
      value: acceptedTerms,
      onChanged: (bool? value) {
        setState(() {
          acceptedTerms = value ?? false;
        });
      },
    ),
    GestureDetector(
      onTap: () {
        if (!acceptedTerms) {
          _mostrarTerminosCondiciones();
        }
      },
      child: Text(
        "Aceptación de los Términos y Condiciones",

        style: TextStyle(
          color: Colors.blue, // Color del texto para términos y condiciones
          decoration: TextDecoration.underline,
        ),
      ),
    ),
  ],
),
            SizedBox(height: 15.0),
            ElevatedButton(
              onPressed: () {
                // Lógica para guardar los datos del formulario
                if (acceptedTerms) {
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
     } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Debes aceptar los términos y condiciones para continuar.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
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
