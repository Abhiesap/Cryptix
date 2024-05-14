// ignore_for_file: file_names

import 'package:flutter/material.dart';

class FavUI extends StatelessWidget {
  const FavUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Your wishlisted cryptocurrencies would shown here.',
        style: TextStyle(
            fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
