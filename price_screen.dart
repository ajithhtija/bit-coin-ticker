import 'package:flutter/material.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  String selectedcurrency = 'USD';
  String answer1 = '?';
  String answer2 = '?';
  String answer3 = '?';

  DropdownMenuItem<String> getitem(String t)
  {
    return DropdownMenuItem(
      child: Text(t),
      value: t,
    );
  }
  void doit(String sc) async
  {
    CoinData cd = CoinData(sc);
    String Answer1 = await cd.getdata('BTC');
    String Answer2 = await cd.getdata('ETH');
    String Answer3 = await cd.getdata('LTC');
    setState(() {
      answer1 = Answer1;
      answer2 = Answer2;
      answer3 = Answer3;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body:
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $answer1 $selectedcurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ETH = $answer2 $selectedcurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
           Padding(
               padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
            color: Colors.lightBlueAccent,
           elevation: 5.0,
           shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
             ),
            child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
             child: Text(
              '1 LTC = $answer3 $selectedcurrency',
             textAlign: TextAlign.center,
             style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
                  ),
                    ),
                 ),
                ),
              ),
          SizedBox(
            height: 370,
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton<String> (
              value: selectedcurrency,
              items: [
                for(int i=0;i<currenciesList.length;i++)
                getitem(currenciesList[i]),
              ],
              onChanged: (value) {
                   setState(() {
                     selectedcurrency = value;
                     answer1 = '?';
                     answer2 = '?';
                     answer3 = '?';
                   });
                   doit(selectedcurrency);
              }
            ),
          ),
        ],
      ),
    );
  }
}
