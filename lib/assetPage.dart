// ignore_for_file: file_names, library_private_types_in_public_api, must_call_super

import 'package:cryptix/NetworkHelper.dart';
import 'package:flutter/material.dart';
import 'NetworkHelper.dart';

class AssetUI extends StatefulWidget {
  const AssetUI({Key? key}) : super(key: key);

  @override
  _AssetUIState createState() => _AssetUIState();
}

class _AssetUIState extends State<AssetUI> {
  Networkhelper apiCall = Networkhelper();
  List<CryptoItem> cryptoItemList = [];

  @override
  void initState() {
    apiCall.getJSONdata();
  }

  // List<CryptoItem> addItemToCrptos() {
  //   for (CoinData coin in apiCall.coinDataList) {
  //     var tempCoinObj = CryptoItem(
  //       imagePath: coin.imageURL,
  //       name: coin.name,
  //       description: coin.symbol,
  //       value: "\$${coin.currentPrice}",
  //       growth: coin.percentChange,
  //     );

  //     cryptoItemList.add(tempCoinObj);
  //   }

  //   return cryptoItemList;
  // }

  Widget addItemToCryptos() {
    for (CoinData coin in apiCall.coinDataList) {
      var tempCoinObj = CryptoItem(
        imagePath: coin.imageURL,
        name: coin.name,
        description: coin.symbol,
        value: "\$${coin.currentPrice}",
        growth: coin.percentChange,
      );

      cryptoItemList.add(tempCoinObj);
    }

    return ListView(children: cryptoItemList);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16.0,
        ),
        Expanded(child: addItemToCryptos()),
      ],
    );
  }
}

// ignore: camel_case_types
class searchbar extends StatelessWidget {
  const searchbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ))
      ],
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'ETH',
    'BTC',
    'SOL',
    'USDT',
    'XRP',
    'MATIC',
    'GALA',
    'SHIB',
    'DOGE',
    'Bitcoin',
    'Etherum',
    'Tether',
    'Cardano',
    'Solana',
    'Polygon',
    'Dogecoin',
  ];

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var i in searchTerms) {
      if (i.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(i);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var i in searchTerms) {
      if (i.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(i);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }
}

// ignore: unused_element
class _SearchField extends StatelessWidget {
  const _SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(
              color: Colors.white.withOpacity(0.5),
              width: 1.0,
            )),
        child: Row(
          children: [
            const SizedBox(
              width: 8.0,
            ),
            Icon(
              Icons.search,
              color: Colors.white.withOpacity(0.5),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Expanded(
                child: TextField(
              controller: TextEditingController(),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.5))),
              style: const TextStyle(color: Colors.white),
            )),
            const SizedBox(width: 8.0),
          ],
        ),
      ),
    );
  }
}

// ignore: unused_element
class _Filters extends StatelessWidget {
  const _Filters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: const [
        SizedBox(
          width: 10.0,
        ),
        _Filter(name: "Tradable", isActive: true),
        _Filter(name: "Watchlist"),
        _Filter(name: "New Cryptos"),
        _Filter(name: "All assets"),
        _Filter(name: "Watchlist"),
        _Filter(name: "New Cryptos"),
        _Filter(name: "All assets"),
        SizedBox(
          width: 10.0,
        ),
      ],
    );
  }
}

class _Filter extends StatelessWidget {
  const _Filter({Key? key, required this.name, this.isActive = false})
      : super(key: key);

  final bool isActive;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      //width: 120.0,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: isActive ? Colors.blue.withOpacity(0.1) : Colors.transparent,
        border: Border.all(
          color: isActive ? Colors.blue : Colors.transparent,
        ),
      ),
      child: Center(
        child: Text(
          name,
          style: TextStyle(
            color: isActive ? Colors.blue : Colors.white,
          ),
        ),
      ),
    );
  }
}

// class _Cryptos extends StatefulWidget {
//   const _Cryptos({Key? key}) : super(key: key);

//   @override
//   __CryptosState createState() => __CryptosState();
// }

// class __CryptosState extends State<_Cryptos> {
//   Networkhelper apiCall = Networkhelper();
//   List<CryptoItem> cryptoItemList = [];

//   @override
//   void initState() {
//     apiCall.getJSONdata();
//   }

//   List<CryptoItem> addItemToCrptos() {
//     for (CoinData coin in apiCall.coinDataList) {
//       var tempCoinObj = CryptoItem(
//         imagePath: coin.imageURL,
//         name: coin.name,
//         description: coin.symbol,
//         value: "\$${coin.currentPrice}",
//         growth: coin.percentChange,
//       );

//       cryptoItemList.add(tempCoinObj);
//     }

//     return cryptoItemList;
//   }

//   Widget addItemToCrptos() {
//     for (CoinData coin in apiCall.coinDataList) {
//       var tempCoinObj = CryptoItem(
//         imagePath: coin.imageURL,
//         name: coin.name,
//         description: coin.symbol,
//         value: "\$${coin.currentPrice}",
//         growth: coin.percentChange,
//       );

//       cryptoItemList.add(tempCoinObj);
//     }

//     return ListView(children: cryptoItemList);
//   }

//   // @override
//   // Widget build(BuildContext context) {
//   //   return ListView(
//   //     children: addItemToCrptos(),
//   //   );
//   // }
// }

class CryptoItem extends StatelessWidget {
  const CryptoItem(
      {Key? key,
      required this.imagePath,
      required this.name,
      required this.description,
      required this.value,
      required this.growth})
      : super(key: key);

  final String description;
  final double growth;
  final String imagePath;
  final String name;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80.0,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(0)),
            child: SizedBox(
              width: 40.0,
              height: 40.0,
              child: Image.network(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Text(
                description,
                style: TextStyle(color: Colors.white.withOpacity(0.5)),
              ),
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Text(
                growth < 0 ? "$growth%" : "+$growth%",
                style: TextStyle(
                    color: growth < 0 ? Colors.red[300] : Colors.green[300]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ignore: unused_element
class _SeeAllButton extends StatelessWidget {
  const _SeeAllButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        height: 50.0,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(color: Colors.white.withOpacity(0.5))),
        child: const Center(
          child: Text(
            "SEE  ALL",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w300),
          ),
        ),
      ),
    );
  }
}


// const [
//         _CryptoItem(
//           imagePath: "images/bitcoin.png",
//           name: "Bitcoin",
//           description: "BTC",
//           value: "\$50,906.60",
//           growth: -6.27,
//         ),
//         _CryptoItem(
//           imagePath: "images/ethereum.png",
//           name: "Etherum",
//           description: "ETC",
//           value: "\$5,906.60",
//           growth: -4.27,
//         ),
//         _CryptoItem(
//           imagePath: "images/tether.png",
//           name: "Tether",
//           description: "USDT",
//           value: "\$0.86",
//           growth: 0.26,
//         ),
//         _CryptoItem(
//           imagePath: "images/cardano.png",
//           name: "Cardano",
//           description: "ADA",
//           value: "\$1.72",
//           growth: -8.27,
//         ),
//         _CryptoItem(
//           imagePath: "images/solana.png",
//           name: "Solana",
//           description: "SOL",
//           value: "\$166.98",
//           growth: 6.27,
//         ),
//         _CryptoItem(
//           imagePath: "images/xrp.png",
//           name: "XRP",
//           description: "XRP",
//           value: "\$50,906.60",
//           growth: -6.27,
//         ),
//         _CryptoItem(
//           imagePath: "images/polygon.png",
//           name: "Polygon",
//           description: "MATIC",
//           value: "\$5,906.60",
//           growth: -4.27,
//         ),
//         _CryptoItem(
//           imagePath: "images/gala.png",
//           name: "Gala",
//           description: "GALA",
//           value: "\$0.86",
//           growth: 0.26,
//         ),
//         _CryptoItem(
//           imagePath: "images/shiba.png",
//           name: "Shiba INU",
//           description: "SHIB",
//           value: "\$1.72",
//           growth: -8.27,
//         ),
//         _CryptoItem(
//           imagePath: "images/doge.png",
//           name: "Dogecoin",
//           description: "DOGE",
//           value: "\$166.98",
//           growth: 6.27,
//         ),
//       ],