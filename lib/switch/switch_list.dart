import 'package:flutter/material.dart';

class SwitchList extends StatefulWidget {
  const SwitchList({super.key});

  @override
  State<SwitchList> createState() => SwitchListState();
}

class SwitchListState extends State<SwitchList> {
  final List<bool> _switches = [];

  @override
  Widget build(BuildContext context) => ListView.builder(
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
  );

  void _removeSwitch(int index) {
    print('it is active  0$index');
    if (_switches[index]) {
      print('it is active');
    } else {
      setState(() {
        _switches.removeAt(index);
        print('it is active  0$index');
      });
    }
  }

  void addSwitch() {
    setState(() {
      _switches.add(false);
    });
  }
}
