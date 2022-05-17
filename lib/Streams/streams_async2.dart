import 'package:flutter/material.dart';

Future<void> main() async {
  debugPrint('Current time is {$DateTime.now()}');
  final time = await Future.delayed(const Duration(seconds: 5))
      .then((value) => DateTime.now);
  debugPrint('Awaited time was at $time');
}
