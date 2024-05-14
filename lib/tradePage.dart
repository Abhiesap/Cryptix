// ignore_for_file: file_names

import 'package:flutter/material.dart';

class TradeUI extends StatelessWidget {
  const TradeUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'All your crypto assets will be shown here.',
        style: TextStyle(
            fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
