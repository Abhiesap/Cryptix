// ignore_for_file: unused_import

import 'package:cryptix/NetworkHelper.dart';
import 'package:cryptix/assetPage.dart';
import 'package:cryptix/exchangePage.dart';
import 'package:cryptix/favPage.dart';
import 'package:cryptix/payPage.dart';
import 'package:cryptix/tradePage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

const List _pages = [AssetUI(), TradeUI(), ExchangeUI(), PayUI(), FavUI()];

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 7, 3, 3),
      appBar: AppBar(
        // backgroundColor: const Color.fromARGB(255, 9, 10, 10),
        backgroundColor: Colors.blue,
        elevation: 0,
        title: const Text(
          "CryptiX",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: const Icon(Icons.menu),
        actions: const [
          SizedBox(
            height: 30.0,
            width: 30.0,
          ),
          SizedBox(width: 8.0),
          searchbar(),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        backgroundColor: const Color(0xff121315),
        unselectedItemColor: const Color.fromARGB(255, 244, 244, 248),
        showSelectedLabels: true,
        selectedItemColor: const Color.fromARGB(255, 60, 118, 218),
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart_outline),
            backgroundColor: Color(0xff121315),
            label: "Assets",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph_outlined),
            label: "Trade",
            backgroundColor: Color(0xff121315),
          ),
          BottomNavigationBarItem(
            label: "Exchange",
            backgroundColor: const Color(0xff121315),
            icon: Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 60, 118, 218),
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: const Center(
                child: Icon(
                  Icons.compare_arrows,
                  color: Color(0xff121315),
                ),
              ),
            ),
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: "Pay",
            backgroundColor: Color(0xff121315),
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.star_outline),
            label: "For you",
            backgroundColor: Color(0xff121315),
          ),
        ],
      ),
    );
  }
}
