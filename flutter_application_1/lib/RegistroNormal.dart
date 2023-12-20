import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();

  
}



class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            
                const Text('FROM NETWORK'),
 
                MultiSelectDropDown.network(
                  dropdownHeight: 300,
                  onOptionSelected: (options) {
                    debugPrint(options.toString());
                  },
                  searchEnabled: true,
                  networkConfig: NetworkConfig(
                    url: 'https://jsonplaceholder.typicode.com/users',
                    method: RequestMethod.get,
                    headers: {
                      'Content-Type': 'application/json',
                    },
                  ),
                  chipConfig: const ChipConfig(wrapType: WrapType.wrap),
                  responseParser: (response) {
                    final list = (response as List<dynamic>).map((e) {
                      final item = e as Map<String, dynamic>;
                      return ValueItem(
                        label: item['name'],
                        value: item['id'].toString(),
                      );
                    }).toList();

                    return Future.value(list);
                  },
                  responseErrorBuilder: ((context, body) {
                    return const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text('Error fetching the data'),
                    );
                  }),
                ),
                const SizedBox(height: 50)
              ],
            ),
          ),
        ));
  }
}