import 'package:flutter/material.dart';
import 'switch_list.dart';

class SwitchTask2 extends StatelessWidget {
  const SwitchTask2({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<SwitchListState> switchListKey = GlobalKey<SwitchListState>();

    return Scaffold(
      body: SwitchList(key: switchListKey),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          switchListKey.currentState?.addSwitch();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
