import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/views/widgets/text_input_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              "Tiktok Clone",
              style: TextStyle(
                fontSize: 35,
                color: buttonColor,
                fontWeight: FontWeight.w900,
              ),
            ),
            const Text(
              "Login",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 25),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                controller: _emailController,
                icon: Icons.email,
                isObscure: false,
                labelText: "Email",
              ),
            )
          ],
        ),
      ),
    );
  }
}
