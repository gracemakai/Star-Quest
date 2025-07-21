import 'package:flutter/material.dart';

class LevelCompleteOverlay extends StatelessWidget {
  final VoidCallback onNextLevel;

  const LevelCompleteOverlay({super.key, required this.onNextLevel});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.white,
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Level Complete!',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: onNextLevel,
                child: const Text('Next Level'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
