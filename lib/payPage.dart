// ignore_for_file: file_names

import 'package:flutter/material.dart';

class PayUI extends StatelessWidget {
  const PayUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'All your Trasaction would shown here.',
        style: TextStyle(
            fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
