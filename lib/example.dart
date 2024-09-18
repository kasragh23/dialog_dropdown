import 'package:flutter/material.dart';

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  double valueSlider = 20;
  double _imageSize = 200;


  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('example'),
        ),
        body: _body(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showDialog();
          },
          child: const Icon(Icons.add),
        ),
      );

  void _showDialog() {
    showDialog(
        context: context,
        builder: (context) =>
            Dialog(
              backgroundColor: Colors.yellow.shade400,
              child: SizedBox(
                height: 100,
                width: 150,
                child: Container(
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(1)),
                  child: const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text('Your pop is is shown')),
                ),
              ),
            ));
  }

  Widget _body() =>
      Column(
        children: [
          Expanded(child: Center(
            child: Image.network(
              'https://images.pexels.com/photos/1450353/pexels-photo-1450353.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
              width: _imageSize,
              height: _imageSize,
            ),

          ),

          ),
          _button(),
          Slider(
              value: _imageSize,
              min: 10,
              max: 300,
              divisions: 9,
              thumbColor: Colors.deepPurple.shade400,
              label: _imageSize.toStringAsFixed(0),
              activeColor: Colors.deepPurple,
              inactiveColor: Colors.pink.shade200,
              onChanged: (value) {
                setState(() {
                  _imageSize = value;
                });
              })
        ],
      );

  Widget _button() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('your login is fine'),
                action: SnackBarAction(label: 'undo', onPressed: () {}),
              ),
            );
          },
          child: const Text('press')),
    );
  }
}
