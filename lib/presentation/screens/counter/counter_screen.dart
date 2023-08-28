import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  static const name = 'counter_screen';
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int valor = 10;

  void incrementCounter() {
    setState(() {
      valor++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
      ),
      body: Center(child: Text('Valor: $valor')),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}
