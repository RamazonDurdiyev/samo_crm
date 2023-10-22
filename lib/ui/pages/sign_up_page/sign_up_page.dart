import 'package:flutter/material.dart';
import 'package:samo_crm/ui/pages/home_page/home_page.dart';
import 'package:samo_crm/ui/pages/sign_in_page/sign_in_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
            "Create account",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        _buildPhoneTextField(
          TextEditingController(),
          "Phone number",
        ),
        const SizedBox(
          height: 8,
        ),
        _buildPasswordTextField(
          TextEditingController(),
          "Password",
        ),
        const SizedBox(
          height: 24,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Full name",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        _buildTextField(
          TextEditingController(),
          "Full name",
        ),
        const SizedBox(
          height: 32,
        ),
        _buildSignButton(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Already have an account?",
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SignInPage();
                    },
                  ),
                );
              },
              child: const Text(
                "Sign In",
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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const HomePage();
              },
            ),
          );
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
          "Sign Up",
        ),
      ),
    );
  }

  _buildTextField(TextEditingController ctrl,String hint){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        child: TextField(
          controller: ctrl,
          cursorColor: Colors.indigo,
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

  _buildPhoneTextField(TextEditingController ctrl, String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        child: TextField(
          controller: ctrl,
          keyboardType: TextInputType.phone,
          cursorColor: Colors.indigo,
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


  _buildPasswordTextField(TextEditingController ctrl,String hint){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        child: TextField(
          controller: ctrl,
          cursorColor: Colors.indigo,
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
