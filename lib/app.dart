import 'package:dialog_17_18/DropDown_Task/dropdown_task.dart';
import 'package:dialog_17_18/example.dart';
import 'package:dialog_17_18/switch/switch_task2.dart';
import 'package:dialog_17_18/switch_task.dart';
import 'package:flutter/material.dart';

import 'DropDown_Task/drop_down.dart';



class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const DropDown(),
    );
  }
}