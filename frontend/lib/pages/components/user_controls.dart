import 'package:flutter/material.dart';

class UserControls extends StatelessWidget {
  final VoidCallback onIncrement;
  final VoidCallback onIncrementHampter;
  final VoidCallback onClearAll;

  const UserControls({
    super.key,
    required this.onIncrement,
    required this.onIncrementHampter,
    required this.onClearAll,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        children: [
          SizedBox(
            width: 155.0,
            height: 50.0,
            child: FloatingActionButton(
              heroTag: "Increment",
              onPressed: onIncrement,
              tooltip: 'PointIncrease',
              child: const Icon(Icons.favorite),
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 155.0,
            height: 50.0,
            child: FloatingActionButton(
              heroTag: "HampterIncrease",
              onPressed: onIncrementHampter,
              tooltip: 'Hampster Increment',
              child: const Icon(Icons.pets),
            ),
          ),
        ],
      ),
    );
  }
}
