import 'package:flutter/material.dart';

class Textfieldd extends StatelessWidget {
  String hinttexxt;
  final bool obs;
  final TextEditingController textcont;
  Textfieldd(
      {super.key,
      required this.hinttexxt,
      required this.obs,
      required this.textcont});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: textcont,
        obscureText: obs,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Theme.of(context).colorScheme.tertiary,
            )),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            )),
            fillColor: Theme.of(context).colorScheme.secondary,
            filled: true,
            hintText: hinttexxt,
            hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary)),
      ),
    );
  }
}
