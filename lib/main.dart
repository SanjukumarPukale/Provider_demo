import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return ChangeNotifierProvider(
     create: (context) => Counter(),
     child: Builder(
       builder: (context){
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
         ),
           home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
       }, 
      ),
     );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  int count = 0;
  Timer? time;

  @override
  void initState() {
    super.initState();

    time = Timer.periodic(Duration(seconds: 1), (timer) {
      var pro = Provider.of<Counter>(context, listen: false);
      pro.addCounter();
     });
  }


  @override
  Widget build(BuildContext context) {
   print('build'+count.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<Counter>(builder: (context, value, child) {
              return Text(value.counter.toString(),
            style: const TextStyle(fontSize: 30, color: Colors.black),
             );
            },
          ),
            
          ],
        ),
      ), 
    );
  }
}
