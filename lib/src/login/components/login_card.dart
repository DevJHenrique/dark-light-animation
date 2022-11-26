import 'package:flutter/material.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({
    Key? key,
    required this.isDarkTheme,
    required this.backgroudIconColorDark,
    required this.backgroudIconColorLight,
    required this.textColorDark,
    required this.textColorLight,
    required this.passController,
    required this.loginController,
  }) : super(key: key);

  final bool isDarkTheme;
  final Color backgroudIconColorDark;
  final Color backgroudIconColorLight;
  final Color textColorDark;
  final Color textColorLight;

  final TextEditingController passController;
  final TextEditingController loginController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
        color: isDarkTheme ? backgroudIconColorDark : backgroudIconColorLight,
      ),
      width: 300,
      height: 255,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'LOGIN',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: isDarkTheme ? textColorDark : textColorLight,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextField(
            controller: loginController,
            style: TextStyle(
              fontSize: 14,
              color: isDarkTheme ? textColorDark : textColorLight,
            ),
            cursorColor: isDarkTheme ? textColorDark : textColorLight,
            decoration: InputDecoration(
              labelStyle: TextStyle(
                fontSize: 12,
                color: isDarkTheme ? textColorDark : textColorLight,
              ),
              labelText: 'EMAIL',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: isDarkTheme ? textColorDark : textColorLight,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: isDarkTheme ? textColorDark : textColorLight,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: passController,
            style: TextStyle(
              fontSize: 14,
              color: isDarkTheme ? textColorDark : textColorLight,
            ),
            obscureText: true,
            cursorColor: isDarkTheme ? textColorDark : textColorLight,
            decoration: InputDecoration(
              labelStyle: TextStyle(
                fontSize: 12,
                color: isDarkTheme ? textColorDark : textColorLight,
              ),
              labelText: 'PASSWORD',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: isDarkTheme ? textColorDark : textColorLight,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: isDarkTheme ? textColorDark : textColorLight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
