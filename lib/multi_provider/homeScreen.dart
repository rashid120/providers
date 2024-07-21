
import 'package:first_provider/multi_provider/changeName.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,),
      body: Column(
        children: [
          Consumer<ChangeName>(builder: (context, value, child) => Container(
            padding: const EdgeInsets.all(20),
            child: Card(
              child: Text("My name is ${value.name}"),
            ),
          ),),
          const SizedBox(height: 10,),
          TextField(
            controller: name,
            decoration: const InputDecoration(
              labelText: 'Enter your name'
            ),
          ),
          const SizedBox(height: 10,),
          ElevatedButton(onPressed: () {
            Provider.of<ChangeName>(context, listen: false).change(newName: name.text);
          }, child: const Text('Save name'))
        ],
      ),
    );
  }
}
