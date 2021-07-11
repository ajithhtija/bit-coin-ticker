import 'dart:convert';
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

class CoinData {
  CoinData(this.sc);
  final String sc;
  Future<String> getdata(String s) async {
        String url = 'https://rest.coinapi.io/v1/exchangerate/$s/$sc?apikey=6F083BB1-4FA7-45FE-B67F-15EA911A90AF';
        http.Response response = await http.get(url);
        if (response.statusCode == 200) {
          String data = response.body;
          print(data);
          double x = jsonDecode(data)['rate'];
          return x.toStringAsFixed(2);
        }
          else{
          print(response.statusCode);
          }
      }
}