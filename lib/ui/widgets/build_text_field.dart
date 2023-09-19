import 'package:flutter/material.dart';

buildTextField(TextEditingController ctrl,String hint){
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 40,
        child: TextField(
          controller: ctrl,
          cursorColor: const Color.fromARGB(255, 4, 27, 66),
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.search,
              color: Colors.white.withOpacity(0.5),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            hintText: hint,
            hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 16,
                fontFamily: "Lato"),
            fillColor: Colors.white.withOpacity(0.1),
            filled: true,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(24),
                ),
                borderSide: BorderSide.none),
          ),
        ),
      ),
    );
}