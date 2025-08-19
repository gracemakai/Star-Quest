import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:star_quest/star_quest.dart';

class MainMenu extends StatelessWidget{
  final StarQuestGame game;

  const MainMenu({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    const blackTextColor = Color.fromRGBO(0, 0, 0, 1.0);
    const whiteTextColor = Color.fromRGBO(255, 255, 255, 1.0);

    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          height: game.bannerHeight,
            width: game.bannerWidth,
          decoration: const BoxDecoration(
            color: blackTextColor,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Star Quest',
                style: TextStyle(
                  fontSize: 24.sp,
                  color: whiteTextColor,
                ),
              ),
              SizedBox(height: 0.05.sh),
              ElevatedButton(
                onPressed: () {
                  game.overlays.remove('MainMenu');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: whiteTextColor,
                ),
                child: Text(
                  'Play',
                  style: TextStyle(
                    fontSize: 20.0.sp,
                    color: blackTextColor,
                  ),
                ),
              ),
              SizedBox(height: 0.05.sh),
              Text(
                '''Use WASD or Arrow Keys for movement.
Space bar to jump.
Collect as many stars as you can and avoid enemies!''',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: whiteTextColor,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}