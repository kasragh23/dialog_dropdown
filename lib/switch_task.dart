import 'package:dialog_17_18/example.dart';
import 'package:flutter/material.dart';

class SwitchTask extends StatefulWidget {
  const SwitchTask({super.key});

  @override
  State<SwitchTask> createState() => _SwitchTaskState();
}

class _SwitchTaskState extends State<SwitchTask> {
  final List<bool> _switches = [];

  //TODO: extract switches to another file.dart

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ListView.builder(
          itemCount: _switches.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Switch ${index + 1}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Switch(
                    value: _switches[index],
                    onChanged: (bool value) {
                      setState(() {
                        _switches[index] = value;
                        print(value);
                      });
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _removeSwitch(index),
                  ),

                ],
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _addSwitch,
          child: const Icon(Icons.add),
        ),

      );

  void _removeSwitch(int index) {
    print('it is active  0$index');
    if (_switches[index]) {
      print('it is active');
    } else {
      setState(() {
        _switches.removeAt(index);
        print(
            'it is active  0$index'); // Remove the switch at the specified index
      });
    }
  }

  void _addSwitch() {
    setState(() {
      _switches.add(false); // Add a new switch with initial state 'false'
    });
  }
}
