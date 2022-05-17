import 'package:flutter/material.dart';
import 'dart:async';

class CounterApp extends StatefulWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  // Creates an instance of the stream controller class
  final StreamController _controller = StreamController();
  // Set initial counter value to 10 seconds;
  int _counter = 10;

// StartTimer method

  void startTimer() async {
// Timer method runs every second
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _counter--;
      // Add event/data to stream controller using sink.
      _controller.sink.add(_counter);

      // Will stop Count Down timer when _counter valie is 0
      if (_counter <= 0) {
        timer.cancel();
        _controller.close();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    // Destroy the stream controllwer when user exits the app
    _controller.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
                initialData: _counter,
                stream: _controller.stream,
                builder: (context, snapshot) {
                  return Text('${snapshot.data}');
                }),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  // Start the timer
                  startTimer();
                },
                child: const Text('Start Count Down'))
          ],
        ),
      ),
    );
  }
}
