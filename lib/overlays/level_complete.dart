import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              Text(
                'Level Complete!',
                style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
              ),
               SizedBox(height: 0.05.sh),
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
