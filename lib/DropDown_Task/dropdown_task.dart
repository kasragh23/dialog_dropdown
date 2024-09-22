import 'package:flutter/material.dart';

class DropdownTask extends StatefulWidget {
  const DropdownTask({super.key});

  @override
  State<DropdownTask> createState() => _DropdownTaskState();
}

class _DropdownTaskState extends State<DropdownTask> {

  final List<String> _dropdownItems = ['Item 1', 'Item 2', 'Item 3'];
  String? _selectedItem;
  final TextEditingController _textController = TextEditingController();


  @override
  Widget build(BuildContext context) => Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        children: [
          DropdownButton<String>(
            iconEnabledColor: Colors.yellowAccent.shade400,
            borderRadius: BorderRadius.circular(8),
            dropdownColor: Colors.greenAccent,
            focusColor: Colors.greenAccent,
            value: _selectedItem,
            hint: const Text('Select an item'),
            items: _dropdownItems.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedItem = newValue;
              });
            },
          ),
          TextField(
            controller: _textController,
            decoration: InputDecoration(
              labelText: 'Enter new item',
              suffixIcon: IconButton(
                  onPressed: _deleteItem,
                  icon: const Icon(Icons.delete, color: Colors.deepOrange,)
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _addItem,
                child: const Text('Add Item'),
              ),
            ],
          ),
        ],
      ),
    ),
  );

  void _addItem() {
    setState(() {
      String text = _textController.text.toLowerCase();
      if (_textController.text.isNotEmpty) {
        _dropdownItems.add(text);
        _textController.clear();
      }
    });
  }

  void _deleteItem() {
    setState(() {
      String text = _textController.text.toLowerCase();
      if (_dropdownItems.contains(text)) {
        _dropdownItems.remove(text);
        _textController.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$text does not exist in the dropdown menu')),
        );
      }
    });
  }
}

