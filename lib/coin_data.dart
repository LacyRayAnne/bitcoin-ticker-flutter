import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '5CEB0F7A-2C45-4B2D-9008-E3198FCADEA7';

class CoinData {
  CoinData({this.fiat, this.coin});

  String fiat;
  String coin;

  Future getCoinData(
      {@required String fiatType, @required String coinType}) async {
    double exchangeRate;
    var coinData;
    http.Response response =
        await http.get('$coinAPIURL/$coinType/$fiatType?apikey=$apiKey');

    if (response.statusCode == 200) {
      coinData = jsonDecode(response.body);
      exchangeRate = coinData['rate'];
      return exchangeRate;
    } else {
      print(response.statusCode);
      print(response.body);
      throw 'problem fetching data Status Code: ${response.statusCode}';
    }
  }
}
