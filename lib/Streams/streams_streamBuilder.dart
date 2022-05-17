import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(StreamBuilderApp());

class StreamBuilderApp extends StatelessWidget {
  const StreamBuilderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'StreamBuilder Demo',
        theme: ThemeData(
          primaryColor: Colors.purpleAccent,
        ));
  }
}

class CounterApp extends StatefulWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  //Creates an instance of the stream controller class
  final StreamController _controller = StreamController();
  final int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
