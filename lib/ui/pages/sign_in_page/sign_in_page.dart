import 'package:flutter/material.dart';
import 'package:samo_crm/ui/pages/home_page/home_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Sign In",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        _buildTextField(
          TextEditingController(),
          "Phone number",
        ),
        const SizedBox(
          height: 8,
        ),
        _buildTextField(
          TextEditingController(),
          "Password",
        ),
        const SizedBox(
          height: 32,
        ),
        _buildSignButton(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don`t have an account?",
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.indigo,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  _buildSignButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const HomePage();
          },),);
        },
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          backgroundColor: Colors.indigo,
          fixedSize: const Size(
            double.maxFinite,
            60,
          ),
        ),
        child: const Text(
          "Sign In",
        ),
      ),
    );
  }

  _buildTextField(TextEditingController ctrl, String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        child: TextField(
          controller: ctrl,
          cursorColor: const Color.fromARGB(255, 4, 27, 66),
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            suffixIcon: const Icon(
              Icons.call,
              color: Colors.grey,
            ),
            hintText: hint,
            hintStyle: const TextStyle(
                color: Colors.grey, fontSize: 16, fontFamily: "Lato"),
            fillColor: const Color.fromARGB(255, 236, 234, 234),
            filled: true,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                borderSide: BorderSide.none),
          ),
        ),
      ),
    );
  }
}
