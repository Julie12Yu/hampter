import 'package:flutter/material.dart';

class TestingDisplay extends StatelessWidget {
  final VoidCallback onIncrement;
  final VoidCallback onIncrementHampter;
  final VoidCallback onClearAll;

  const TestingDisplay({
    super.key,
    required this.onIncrement,
    required this.onIncrementHampter,
    required this.onClearAll,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        child: Row(
          children: [
            SizedBox(
              width: 155.0,
              height: 50.0,
              child: FloatingActionButton(
                onPressed: onIncrement,
                tooltip: 'Increment',
                child: const Icon(Icons.favorite),
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: 155.0,
              height: 50.0,
              child: FloatingActionButton(
                onPressed: onIncrementHampter,
                tooltip: 'Hampster Increment',
                child: const Icon(Icons.pets),
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: 155.0,
              height: 50.0,
              child: FloatingActionButton(
                onPressed: onClearAll,
                tooltip: 'Clear all',
                child: const Icon(Icons.stop_circle),
              ),
            )
          ],
        ),
      ),
    );
  }
}