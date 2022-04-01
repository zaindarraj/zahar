import 'package:flutter/material.dart';

import '../widgets/button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(flex: 3, child: Image.asset("assets/merged logo2.png")),
            Expanded(
                child: Column(
              children: [
                button("Sign in", Theme.of(context).primaryColor, size, context,
                    () {
                      
                    }),
                button("Sign up", Theme.of(context).primaryColor, size, context,
                    () {}),
                button(
                    "Continue as a guest", Colors.white, size, context, () {}),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
