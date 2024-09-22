import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  final List<String> _dropdownItems = ['item1', 'item2', 'item3'];
  String? _selectedItem;
  final TextEditingController _controller = TextEditingController();

  String? getText() {
    return _controller.text.toLowerCase().trim();
  }

  final TextEditingController _controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              DropdownButton<String>(
                  focusColor: Colors.deepPurple.shade300,
                  borderRadius: BorderRadius.circular(16.0),
                  value: _selectedItem,
                  hint: const Text('Select an item'),
                  items: _dropdownItems
                      .map((String item) =>
                          DropdownMenuItem(value: item, child: Text(item)))
                      .toList(),
                  onChanged: (String? newValue) => setState(() {
                        _selectedItem = newValue;
                        _controller2.text = _selectedItem!;
                      })),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                    labelText: 'Enter new item',
                    suffixIcon: IconButton(
                      onPressed: _deleteItem,
                      icon: const Icon(Icons.delete, color: Colors.red),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _controller2,
                decoration: InputDecoration(
                    labelText: 'Update',
                    suffixIcon: IconButton(
                      onPressed: _editItem,
                      icon: Icon(Icons.edit, color: Colors.blue.shade700,),
                    )),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: _addItem, child: const Text('add item'))
                ],
              )
            ],
          ),
        ),
      );

  void _addItem() {
    setState(() {
      String? text = getText();
      if (text!.isNotEmpty) {
        _dropdownItems.add(text);
        _controller.clear();
      }
    });
  }

  void _deleteItem() {
    setState(() {
      String? text = getText();
      if (_dropdownItems.contains(text)) {
        _dropdownItems.remove(text);
        _controller.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$text does not exist in the dropdown menu')),
        );
      }
    });
  }

  void _editItem() {
    setState(() {
      String? newText = _controller2.text.trim();
      if (_selectedItem != null && newText.isNotEmpty) {
        int index = _dropdownItems.indexOf(_selectedItem!);
        if (index != -1) {
          _dropdownItems[index] = newText;
          _selectedItem = newText;
          _controller2.clear();
        }
      }
    });
  }
}
