import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class NetworkingHelper {
  var url;
  NetworkingHelper({required this.url});

  Future getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var jasonResponse = jsonDecode(response.body);
      return jasonResponse;
    } else {
      Fluttertoast.showToast(msg: response.statusCode.toString());
    }
  }
}
