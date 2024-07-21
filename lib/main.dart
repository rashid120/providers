import 'package:first_provider/count_provider.dart';
import 'package:first_provider/multi_provider/changeName.dart';
import 'package:first_provider/multi_provider/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChangeName(),)
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ChangeNotifierProvider(create: (context) => CountNumberProvider(),
              child: Consumer<CountNumberProvider>(builder: (context, value, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("${value.count}"),
                  const SizedBox(height: 10,),
                  ElevatedButton(onPressed: () {
                    value.incrementNumber();
                  }, child: const Text("Update value"))
                ],
              );
            },),
            ),
          ],
        ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondPage(),));
      }, child: const Icon(Icons.add),),
    );
  }
}
