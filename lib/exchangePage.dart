// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ExchangeUI extends StatelessWidget {
  const ExchangeUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'You can covert your cryptocurrencies in other currencies here.',
        style: TextStyle(
            fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
