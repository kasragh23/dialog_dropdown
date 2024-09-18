import 'package:dialog_17_18/DropDown_Task/dropDown_task.dart';
import 'package:dialog_17_18/example.dart';
import 'package:dialog_17_18/switch_task.dart';
import 'package:flutter/material.dart';



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
      home: const DropdownTask(),
    );
  }
}