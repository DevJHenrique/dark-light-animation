import 'package:flutter/material.dart';

import 'components/circle_clipper.dart';
import 'components/stack_theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> sizeAnimation;
  late final Animation<double> iconRotation;

  final TextEditingController passController = TextEditingController();
  final TextEditingController loginController = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    controller.addListener(() {
      setState(() {});
    });
    sizeAnimation = Tween<double>(begin: 0, end: 1080).animate(controller);
    iconRotation = Tween<double>(begin: 0, end: 1).animate(controller);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    passController.dispose();
    loginController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Material(
      child: Stack(
        children: [
          StackTheme(
            loginController: loginController,
            passController: passController,
            isDarkTheme: false,
            size: size,
            controller: controller,
            sizeAnimation: sizeAnimation,
          ),
          ClipPath(
            clipper: CircleClipper(
                center: Offset(size.width - 40, 40),
                radius: sizeAnimation.value),
            child: StackTheme(
              loginController: loginController,
              passController: passController,
              isDarkTheme: true,
              size: size,
              controller: controller,
              sizeAnimation: sizeAnimation,
            ),
          ),
          Positioned(
            top: 28,
            right: 28,
            child: Opacity(
              opacity: 1 - iconRotation.value,
              child: Transform.rotate(
                angle: 4,
                child: const Icon(
                  Icons.nightlight_round_sharp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: IconButton(
              icon: Opacity(
                opacity: iconRotation.value,
                child: RotationTransition(
                  turns: iconRotation,
                  child: const Icon(
                    Icons.wb_sunny,
                    color: Colors.white,
                  ),
                ),
              ),
              onPressed: () {
                if (controller.isCompleted) {
                  controller.reverse();
                } else {
                  controller.forward();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
