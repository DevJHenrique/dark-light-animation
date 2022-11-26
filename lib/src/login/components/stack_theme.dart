import 'package:flutter/material.dart';

import 'gradient_icon.dart';
import 'login_card.dart';

class StackTheme extends StatelessWidget {
  const StackTheme({
    Key? key,
    required this.size,
    required this.controller,
    required this.sizeAnimation,
    required this.isDarkTheme,
    required this.passController,
    required this.loginController,
  }) : super(key: key);

  final Size size;
  final AnimationController controller;
  final Animation<double> sizeAnimation;
  final bool isDarkTheme;

  final List<Color> grandientColorDark = const [
    Color.fromARGB(255, 61, 35, 110),
    Color.fromARGB(255, 0, 61, 110),
  ];
  final List<Color> grandientColorLight = const [
    Colors.blue,
    Colors.deepPurple,
  ];

  final Color backgroudIconColorDark = const Color.fromARGB(255, 68, 68, 68);
  final Color backgroudIconColorLight = Colors.white;

  final Color backgroudColorDark = const Color.fromARGB(255, 44, 44, 44);
  final Color backgroudColorLight = Colors.white;

  final Color textColorDark = const Color.fromARGB(255, 197, 197, 197);
  final Color textColorLight = Colors.black;

  final Color buttonColorDark = const Color.fromARGB(255, 0, 32, 58);
  final Color buttonColorLight = Colors.blue;

  final TextEditingController passController;
  final TextEditingController loginController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors:
                        isDarkTheme ? grandientColorDark : grandientColorLight,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isDarkTheme
                          ? Colors.white70
                          : backgroudIconColorLight,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: GradientIcon(
                      icon: Icons.home,
                      size: 48,
                      gradient: LinearGradient(
                        colors: isDarkTheme
                            ? grandientColorDark
                            : grandientColorLight,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: isDarkTheme ? backgroudColorDark : backgroudColorLight,
              ),
            )
          ],
        ),
        Positioned(
          top: size.height / 2 - 30,
          child: Column(
            children: [
              LoginCard(
                passController: passController,
                isDarkTheme: isDarkTheme,
                backgroudIconColorDark: backgroudIconColorDark,
                backgroudIconColorLight: backgroudIconColorLight,
                textColorDark: textColorDark,
                textColorLight: textColorLight,
                loginController: loginController,
              ),
              const SizedBox(height: 28),
              TextButton(
                onPressed: () {},
                child: Text(
                  'FORGOT PASSWORD?',
                  style: TextStyle(
                    color: isDarkTheme ? textColorDark : textColorLight,
                    fontSize: 9,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: size.height / 2 + 206,
          child: InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: isDarkTheme ? buttonColorDark : buttonColorLight,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              height: 40,
              width: 200,
              child: Center(
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    color: isDarkTheme ? textColorDark : textColorLight,
                    fontSize: 9,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
