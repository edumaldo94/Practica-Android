import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firestore Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyFormPage(),
    );
  }
}

class MyFormPage extends StatefulWidget {
  const MyFormPage({Key? key}) : super(key: key);

  @override
  _MyFormPageState createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  Future<void> _saveData() async {
    String name = _nameController.text;
    int age = int.tryParse(_ageController.text) ?? 0;

    if (name.isNotEmpty && age > 0) {
      try {
        await FirebaseFirestore.instance.collection('users').add({
          'name': name,
          'age': age,
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Datos guardados en Firestore')),
        );
        // Limpiar los campos después de guardar los datos
        _nameController.clear();
        _ageController.clear();
      } catch (e) {
        print('Error al guardar datos: $e');
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, completa todos los campos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guardar Datos en Firestore'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nombre',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _ageController,
              decoration: const InputDecoration(
                labelText: 'Edad',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveData,
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
