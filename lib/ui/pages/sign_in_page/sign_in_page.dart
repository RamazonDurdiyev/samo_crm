import 'package:flutter/material.dart';
import 'package:samo_crm/ui/pages/home_page/home_page.dart';
import 'package:samo_crm/ui/pages/sign_in_page/sign_in_bloc.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = SignInBloc();
    GlobalKey<FormState> phoneKey = GlobalKey();
    GlobalKey<FormState> passwordKey = GlobalKey();
    return Scaffold(
      body: _buildBody(context, bloc, phoneKey, passwordKey),
    );
  }

  _buildBody(BuildContext context, SignInBloc bloc,
      GlobalKey<FormState> phoneKey, GlobalKey<FormState> passwordKey) {
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
          bloc.phoneCtrl,
          bloc,
          "Phone number",
          phoneKey,
        ),
        const SizedBox(
          height: 8,
        ),
        _buildPasswordTextField(
          bloc.passwordCtrl,
          bloc,
          "Password",
          passwordKey,
        ),
        const SizedBox(
          height: 32,
        ),
        _buildSignButton(context, bloc, phoneKey, passwordKey),
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

  _buildSignButton(BuildContext context, SignInBloc bloc,
      GlobalKey<FormState> phoneKey, GlobalKey<FormState> passwordKey) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        onPressed: () {
          if (phoneKey.currentState!.validate() &&
              passwordKey.currentState!.validate()) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const HomePage();
                },
              ),
            );
          }
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

  _buildTextField(TextEditingController ctrl, SignInBloc bloc, String hint,
      GlobalKey<FormState> key) {
    final RegExp phoneRegExp = RegExp(r'^9\d{8}$');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        child: Form(
          key: key,
          child: TextFormField(
            validator: (value) {
              if (value == null) {
                return "Phone number is required";
              } else if (!phoneRegExp.hasMatch(value)) {
                return "Enter correct phone number";
              }
              return null;
            },
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
      ),
    );
  }

  _buildPasswordTextField(TextEditingController passwordCtrl, SignInBloc bloc,
      String hint, GlobalKey<FormState> passwordKey) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        child: Form(
          key: passwordKey,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty || value.length < 6) {
                return "Password length must not less then 6 characters";
              }
              return null;
            },
            controller: bloc.passwordCtrl,
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
      ),
    );
  }
}
