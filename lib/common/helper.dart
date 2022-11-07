import 'dart:convert';

import 'package:http/http.dart' as http;

class Helper {
  dynamic httpHelper(String pUrl) async {
    final url = Uri.parse(pUrl);
    http.Response response = await http.get(url);
    var res = jsonDecode(response.body);
    return res;
  }

  String firstToUpper(String n) {
    return n.substring(0, 1).toUpperCase() + n.substring(1);
  }
}
