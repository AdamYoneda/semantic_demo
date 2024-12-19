import 'package:flutter/material.dart';

class MySemantics extends StatefulWidget {
  const MySemantics({super.key});

  @override
  State<MySemantics> createState() => _MySemanticsState();
}

class _MySemanticsState extends State<MySemantics> {
// slider value
  double _sliderValue = 0.5;

  void _playMusic() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.green[200],
        content: Text(
          'Playing Music at ${(_sliderValue * 100).round()}% volume!',
          style: TextStyle(color: Colors.black, fontSize: 16),
        )));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Semantics',
          style: TextStyle(fontSize: 28),
        ),
        backgroundColor: Colors.green[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // center v
            crossAxisAlignment: CrossAxisAlignment.center, // center h

            children: [
              Semantics(
                label: 'Play Music',
                button: true,
                child: ElevatedButton.icon(
                  onPressed: _playMusic,
                  icon: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 35,
                  ),
                  label: const Text('Play Music'),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16),
                      textStyle: const TextStyle(fontSize: 20),
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.green[200]),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Semantics(
                  label: 'Adjust Volume',
                  value: _sliderValue.toString(),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'Volume Level',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Slider(
                          value: _sliderValue,
                          thumbColor: Colors.green[400],
                          min: 0.0,
                          max: 1.0,
                          divisions: 10,
                          label: (_sliderValue * 100).round().toString(),
                          activeColor: Colors.green[400],
                          inactiveColor: Colors.blueGrey,
                          onChanged: (double value) {
                            setState(() {
                              _sliderValue = value;
                            });
                          })
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
