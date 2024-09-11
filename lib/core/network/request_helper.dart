import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../utils/constants.dart';

class RequestHelper {
  static const API = baseUrl;
  static String? authToken;

  static Map<String, String> headers = {
    'Content-Type': "application/json",
  };

  static Map<String, String> multiRequestHeaders = {
    "Content-type": "multipart/form-data",
  };

  static Future post({String endpoint = '', Map? data, Map<String, String>? header}) async {
    http.Response response;
    Uri url = Uri.parse(API + endpoint);
    Map<String, String> requestHeaders = {...headers};
    if (authToken != null) {
      requestHeaders['Authorization'] = 'Bearer $authToken';
    }
    if (header != null) {
      requestHeaders.addAll(header);
    }
    print('POST API REQUEST :: URL : $url, header : $requestHeaders, data : $data');
    try {
      response = await http.post(url, headers: requestHeaders, body: json.encode(data));
      print('POST API RESPONSE :: ${response.body}');
      return handleResponse(response);
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future get({String endpoint = '', Map<String, String>? header}) async {
    http.Response response;
    Uri url = Uri.parse(API + endpoint);
    Map<String, String> requestHeaders = {...headers};
    if (authToken != null) {
      requestHeaders['Authorization'] = 'Bearer $authToken';
    }
    if (header != null) {
      requestHeaders.addAll(header);
    }
    print('GET API REQUEST :: URL : $url, header : $requestHeaders');
    try {
      response = await http.get(url, headers: requestHeaders);
      print('GET API RESPONSE :: ${response.body}');
      return handleResponse(response);
    } catch (e) {
      print('$e');
      return null;
    }
  }

  static Future put({String endpoint = '', Map? data, Map<String, String>? header}) async {
    http.Response response;
    Uri url = Uri.parse(API + endpoint);
    Map<String, String> requestHeaders = {...headers};
    if (authToken != null) {
      requestHeaders['Authorization'] = 'Bearer $authToken';
    }
    if (header != null) {
      requestHeaders.addAll(header);
    }
    print('PUT API REQUEST :: URL : $url, header : $requestHeaders, data : $data');
    try {
      response = await http.put(url, headers: requestHeaders, body: json.encode(data));
      print('PUT API RESPONSE :: ${response.body}');
      return handleResponse(response);
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future patch({String endpoint = '', Map? data, Map<String, String>? header}) async {
    http.Response response;
    Uri url = Uri.parse(API + endpoint);
    Map<String, String> requestHeaders = {...headers};
    if (authToken != null) {
      requestHeaders['Authorization'] = 'Bearer $authToken';
    }
    if (header != null) {
      requestHeaders.addAll(header);
    }
    print('PATCH API REQUEST :: URL : $url, header : $requestHeaders, data : $data');
    try {
      response = await http.patch(url, headers: requestHeaders, body: json.encode(data));
      print('PATCH API RESPONSE :: ${response.body}');
      return handleResponse(response);
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future delete({String endpoint = '', Map<String, String>? header}) async {
    http.Response response;
    Uri url = Uri.parse(API + endpoint);
    Map<String, String> requestHeaders = {...headers};
    if (authToken != null) {
      requestHeaders['Authorization'] = 'Bearer $authToken';
    }
    if (header != null) {
      requestHeaders.addAll(header);
    }
    print('DELETE API REQUEST :: URL : $url, header : $requestHeaders');
    try {
      response = await http.delete(url, headers: requestHeaders);
      print('DELETE API RESPONSE :: ${response.body}');
      return handleResponse(response);
    } catch (e) {
      print('$e');
      return null;
    }
  }

  static dynamic handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return response;
    } else if (response.statusCode == 400 || response.statusCode == 409 || response.statusCode == 422) {
      final parsed = json.decode(response.body);
      if (parsed["message"] != null) return parsed["message"];
    }
    return null;
  }
}
