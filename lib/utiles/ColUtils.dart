import 'dart:convert';
import 'package:http/http.dart' as http;

class ColUtils {
  void apiData() async {
    int responseLength = 0;
    List<dynamic> responseData = [];

    var apiData = await http
        .get(Uri.parse("https://64e5cc1709e64530d17f0c1f.mockapi.io/cms"));

    responseData = json.decode(apiData.body);
    responseLength = responseData.length;

    print("data ==> $responseLength");
  }
}
