import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class API {
  Future<dynamic> get({required String url, @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': ' Bearer $token',
      });
    }
    http.Response response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("'Failed to load products : ${response.statusCode}'");
    }
  }

  Future<dynamic> post(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': ' Bearer $token',
      });
    }
    http.Response response = await http.post(
        Uri.parse(
          url,
        ),
        body: body,
        headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          "Failed to post data: ${response.statusCode} with body ${jsonDecode(response.body)}");
    }
  }

  Future<dynamic> put(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    headers.addAll({
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    });
    if (token != null) {
      headers.addAll({
        'Authorization': ' Bearer $token',
      });
    }
    print('URL: $url, Body: $body, token: $token');
    http.Response response = await http.put(
        Uri.parse(
          url,
        ),
        body: jsonEncode(body),
        headers: headers);

    if (response.statusCode == 200) {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      Map<String, dynamic> data = jsonDecode(response.body);
      print('Response data: $data');
      return data;
    } else {
      throw Exception(
          "Failed to post data: ${response.statusCode} with body ${jsonDecode(response.body)}");
    }
  }
}
