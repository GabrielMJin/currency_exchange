import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClient{
  final Uri currencyURL = Uri.https("free.currconv.com", "/api/v7/currencies", {"apiKey":"7fb9a1d566364a52beb1"});

  Future<List<String>> getCurrencies() async {
    http.Response res= await http.get(currencyURL);
    if(res.statusCode == 200){
      var body = jsonDecode(res.body);
      var list = body["results"];
      List<String> currencies = (list.keys).toList();
      ;
      return currencies;
    }else{
      throw Exception("failed to connect to API");
    }
  }

  Future<double> getRate(String? from, String? to) async{
    final Uri rateUrl = Uri.https('free.currconv.com', '/api/v7/convert', {
      "apiKey":"7fb9a1d566364a52beb1",
      "q": "${from}_${to}",
      "compact": "ultra"
    });
    http.Response res = await http.get(rateUrl);
    if(res.statusCode == 200){
      var body = jsonDecode(res.body);
      return body["${from}_${to}"];
    }else{
      throw Exception("Failed to connect to API");
    }
  }
}