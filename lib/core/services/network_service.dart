import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class BaseNetworkService {
  Future<dynamic> getGetApiResponse(String url, String token);

  Future<dynamic> getPostApiResponse(String url, Map<String, dynamic> data);
}

class NetworkService extends BaseNetworkService {
  @override
  Future<dynamic> getGetApiResponse(String url, String token) async {
    try {
      var response = await http.get(Uri.parse(url), headers: {
        "Authorization": "Bearer $token",
      });
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        return jsonResponse;
      } else {
        print('Request failed with status: ${response.statusCode}.');
        throw Exception('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      throw Exception('Something wrong happened while requesting http service');
    }
  }

  @override
  Future getPostApiResponse(String url, Map<String, dynamic> data) async {
    try {
      var response = await http.post(Uri.parse(url), body: data);
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        return jsonResponse;
      } else {
        print('Request failed with status: ${response.statusCode}.');
        throw Exception('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      throw Exception('Something wrong happened while requesting http service');
    }
  }
}
