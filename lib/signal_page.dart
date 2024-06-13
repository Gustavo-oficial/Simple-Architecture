import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

final counter = signal(0);
final counterStop = computed<bool>(() => counter.value > 1);

class SignalPage extends StatelessWidget {
  const SignalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text(
              counter.watch(context).toString(),
              style: const TextStyle(
                fontSize: 24
              ),
            ),
          ),
          counterStop.value ?
            const Text(
              'Stop',
              style: TextStyle(
                fontSize: 12
              )
            )
          : const Spacer()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text('Add'),
        onPressed: () => counter.value++
      ),
    );
  }
}