import 'package:flutter/material.dart';
import 'package:auth0_flutter/auth0_flutter.dart';


class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.user});

  final UserProfile user; 

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (user.name != null)
          Text('Name: ${user.name}', style: const TextStyle(color: Colors.white)),
        if (user.email != null)
          Text('Email: ${user.email}', style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}