import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samo_crm/ui/pages/profile_settings/profile_settings_bloc.dart';
import 'package:samo_crm/ui/pages/profile_settings/profile_settings_event.dart';
import 'package:samo_crm/ui/pages/profile_settings/profile_settings_state.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = ProfileSettingsBloc();
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(bloc),
    );
  }

  _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.indigo,
      title: const Text(
        "Profile settings",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  _buildUserImageCircle(ProfileSettingsBloc bloc) {
    return Card(
      elevation: 5,
      shadowColor: Colors.indigo,
      shape: const CircleBorder(),
      child: CircleAvatar(
        backgroundColor: Colors.indigo,
        radius: 43,
        child: GestureDetector(
          onTap: () {
            bloc.add(
              PickImageEvent(),
            );
          },
          child: const CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.person_2,
              size: 32,
              color: Colors.indigo,
            ),
          ),
        ),
      ),
    );
  }

  _buildSeparateText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  _buildBody(ProfileSettingsBloc bloc) {
    return BlocBuilder<ProfileSettingsBloc, ProfileSettingsState>(
      bloc: bloc,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              _buildUserImageCircle(bloc),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  _buildSeparateText("Edit name"),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              _buildTextField(TextEditingController(), "Full name"),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  _buildSeparateText("Edit phone number"),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              _buildTextField(TextEditingController(), "Phone number"),
            ],
          ),
        );
      },
    );
  }

  _buildTextField(TextEditingController ctrl, String hint) {
    return SizedBox(
      child: TextField(
        controller: ctrl,
        cursorColor: Colors.indigo,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
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
    );
  }
}
