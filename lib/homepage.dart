import 'package:flutter/material.dart';

import 'package:flutter_chatapplication_19/auth/authgate.dart';

import 'package:flutter_chatapplication_19/theme/light_mode.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightmode,
      debugShowCheckedModeBanner: false,
      home: const AuthGate()
    );
  }
}
