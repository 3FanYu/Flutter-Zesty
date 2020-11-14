import 'dart:convert';

import 'package:scoped_model/scoped_model.dart';

import 'package:http/http.dart' as http;
import 'package:zesty/conf/config.inc.dart';
import 'package:zesty/model/meal_send_order.dart';

class SendOrderModel extends Model {
  Conf config = new Conf();
  bool _isLoading = false;

  bool get isLoading {
    return _isLoading;
  }

  void sendOrder(SendOrder data) async {
    String api = "orders";
    String url = config.apiPath + api;
    Map<String, String> headers = {"Content-type": "application/json"};
    try {
      http.Response response = await http.post(url,
          headers: headers, body: jsonEncode(data.toJson()));
      print(jsonEncode(data.toJson()));
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("success");
        notifyListeners();
      }
    } catch (error) {
      print(error);
    }
  }
}
