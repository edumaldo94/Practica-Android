import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//import 'dart:convert';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class RegistroProfesional extends StatefulWidget {
  @override
  _RegistroProfesionalState createState() => _RegistroProfesionalState();
}

class _RegistroProfesionalState extends State<RegistroProfesional> {
  bool acceptedTerms = false;
  List<String> countries = []; // Lista de países obtenida de la API
  String? selectedCountry;
  List<String> provinces = []; // Lista de provincias obtenidas de la API
  String? selectedProvince;

// Lista de profesiones seleccionadas

  TextEditingController nombreController = TextEditingController();
  TextEditingController apellidoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController celularController = TextEditingController();
  TextEditingController ciudadController = TextEditingController();
  TextEditingController calleController = TextEditingController();
  TextEditingController contrasenaController = TextEditingController();
  TextEditingController oficioController = TextEditingController();

  Future<void> fetchCountries() async {
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
            child: Text('''
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

  List<ValueItem> opcionesProfesiones = const <ValueItem>[
    ValueItem(label: 'Aire Acondicionado', value: '1'),
    ValueItem(label: 'Albañil', value: '2'),
    ValueItem(label: 'Arquitecto', value: '3'),
    ValueItem(label: 'Automotriz', value: '4'),
    ValueItem(label: 'Belleza', value: '5'),
    ValueItem(label: 'Carpinteria', value: '6'),
    ValueItem(label: 'Cerrajero', value: '7'),
    ValueItem(label: 'Chapista', value: '8'),
    ValueItem(label: 'Computación', value: '9'),
    ValueItem(label: 'Desinfectación', value: '10'),
    ValueItem(label: 'Diseño', value: '11'),
    ValueItem(label: 'Electricidad', value: '12'),
    ValueItem(label: 'Electronica', value: '13'),
    ValueItem(label: 'Eventos', value: '14'),
    ValueItem(label: 'Gasista', value: '15'),
    ValueItem(label: 'Tec. Heladera', value: '16'),
    ValueItem(label: 'Herrero', value: '17'),
    ValueItem(label: 'Jardineria', value: '18'),
    ValueItem(label: 'Lavarropa', value: '19'),
    ValueItem(label: 'Limpieza', value: '20'),
    ValueItem(label: 'Mecanico de Auto', value: '21'),
    ValueItem(label: 'Mecanico de moto', value: '22'),
    ValueItem(label: 'Mudanza', value: '23'),
    ValueItem(label: 'Pintor', value: '24'),
    ValueItem(label: 'Plomero', value: '25'),
    ValueItem(label: 'Seguridad', value: '26'),
    ValueItem(label: 'Tapicero', value: '27'),
    ValueItem(label: 'Tatto', value: '28'),
    ValueItem(label: 'Veterinaria', value: '29'),
    ValueItem(label: 'Otros', value: '30'),
  ];

  List<String> selectedProfesiones = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homework"),
        backgroundColor: Color.fromARGB(255, 255, 189, 66),
      ),
      backgroundColor: Color.fromARGB(255, 255, 189, 66),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: nombreController,
                decoration: InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese su nombre';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: apellidoController,
                decoration: InputDecoration(labelText: 'Apellido'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese su Apellido';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese su Email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: celularController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(labelText: 'Celular'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese su Celular';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: selectedCountry,
                decoration: InputDecoration(labelText: 'País'),
                dropdownColor: Color.fromARGB(255, 255, 188,
                    44), // Opcional: define el color del menú desplegable
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
                    validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese su Pais';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: selectedProvince,
                decoration: InputDecoration(labelText: 'Provincia'),
                dropdownColor: Color.fromARGB(255, 255, 188,
                    44), // Opcional: define el color del menú desplegable
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
                    validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese su Provincia';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: ciudadController,
                decoration: InputDecoration(labelText: 'Ciudad'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese su Ciudad';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: calleController,
                decoration: InputDecoration(labelText: 'Calle'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese su Calle';
                  }
                  return null;
                },
              ),
              TextFormField(
                obscureText: true,
                controller: contrasenaController,
                decoration: InputDecoration(labelText: 'Contraseña'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese su Contraseña';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              const Text(
                'Profesión',
                style: TextStyle(
                  fontSize: 17, // Cambia el tamaño de fuente a 20 puntos

                  // Puedes agregar otros estilos aquí según sea necesario
                ),
              ),
              MultiSelectDropDown(
                
                optionTextStyle: TextStyle(
                  color: Color.fromARGB(255, 112, 31,
                      167), // Cambia el color del texto de las opciones a azul
                  fontSize: 18, // Ajusta el tamaño de fuente si es necesario
                ),
                dropdownHeight: 300,
                onOptionSelected: (List<ValueItem> options) {
                  setState(() {
                    selectedProfesiones =
                        options.map((item) => item.label).toList();
                        
                  });
                  
                },
                options: opcionesProfesiones,
                selectionType: SelectionType.multi,
                chipConfig: ChipConfig(wrapType: WrapType.wrap),
                
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
                        fontSize: 16,
                        color: Colors
                            .blue, // Color del texto para términos y condiciones
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

                  if (_formKey.currentState!.validate()) {
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
                      print('Profesiones seleccionadas: $selectedProfesiones');
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Error'),
                            content: Text(
                                'Debes aceptar los términos y condiciones para continuar.'),
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
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content:
                              Text('Por favor, complete todos los campos.'),
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
                  primary: Color.fromARGB(
                      255, 255, 188, 44), // Cambia el color del botón aquí
                  onPrimary: Color.fromARGB(
                      255, 253, 253, 253), // Color del texto del botón
                  padding: EdgeInsets.symmetric(
                      vertical: 0, horizontal: 0), // Ajusta el tamaño del botón
                  textStyle: TextStyle(
                      fontSize: 25), // Ajusta el tamaño del texto del botón
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        30), // Ajusta el radio de borde del botón
                  ),
                ),
                child: Text('Registrar'),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
