// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables, file_names, library_prefixes

import 'dart:convert';

import 'package:http/http.dart' as Http;

class CoinData {
  var name;
  var symbol;
  var imageURL;
  var currentPrice;
  var percentChange;

  void display() {
    print('Name : $name');
    print('Symbol : $symbol');
    print('Price : $currentPrice');
  }
}

class Networkhelper {
  List<CoinData> coinDataList = [];

  void getJSONdata() async {
    var url = Uri.parse(
        "https://api.coingecko.com/api/v3/coins/markets?vs_currency=USD&ids=&order=market_cap_desc&per_page=100&page=1&sparkline=false");

    try {
      var response = await Http.get(url);
      if (response.statusCode != 200) {
        throw Exception("Invalid response : CLAUSE 1");
      }

      List<dynamic> decodedData = jsonDecode(response.body);
      if (decodedData.isEmpty) throw Exception("Invalid response : CLAUSE 2");

      for (var jsonItem in decodedData) {
        CoinData tempObj = CoinData();

        tempObj.name = jsonItem['name'];
        tempObj.symbol = jsonItem['symbol'];
        tempObj.imageURL = jsonItem['image'];
        tempObj.currentPrice = jsonItem['current_price'];
        tempObj.percentChange = jsonItem['price_change_percentage_24h'];

        coinDataList.add(tempObj);
      }

      // for (CoinData coin in coinDataList) {
      //   coin.display();
      // }
      print('ALL OK');
    } catch (ex) {
      print('ALL NOT OK');
      print(ex.toString());
    }
    // return coinDataList;
  }
}
