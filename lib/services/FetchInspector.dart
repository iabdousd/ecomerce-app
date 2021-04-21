import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:rimlines/configs/memory_veriables.dart' as mv;
import 'package:rimlines/models/inspectors/fetcher_response.dart';

class FetchInspector {
  Future<FetcherResponse> get({
    @required String path,
    Map<String, dynamic> params = const {},
    isBytes = false,
  }) async {
    try {
      String p = params.length > 0 ? "?" : "";
      for (int i = 0; i < params.length; i++) {
        p += params.keys.toList()[i] +
            "=" +
            params.values.toList()[i].toString() +
            (i == (params.length - 1) ? '' : '&');
      }
      var res = await http.get(
        Uri.parse(path + p),
        headers: {
          HttpHeaders.authorizationHeader: mv.jwtToken,
          HttpHeaders.acceptCharsetHeader: 'utf-8',
          HttpHeaders.acceptEncodingHeader: 'utf-8',
          HttpHeaders.contentTypeHeader: 'application/json'
        },
      );
      var body = json.decode(res.body);
      return FetcherResponse(status: res.statusCode, body: body);
    } on SocketException {
      return FetcherResponse.noInternet();
    } catch (e) {
      print(e);
      return FetcherResponse.unknownReason();
    }
  }

  Future<FetcherResponse> post(
      {@required String path,
      Map<String, String> params = const {},
      dynamic body}) async {
    try {
      String p = params.length > 0 ? "?" : "";
      for (int i = 0; i < params.length; i++) {
        p += params.keys.toList()[i] +
            "=" +
            params.values.toList()[i] +
            (i == (params.length - 1) ? '' : '&');
      }
      var res = await http.post(
        Uri.parse(path + p),
        body: body is String ? body : json.encode(body),
        headers: {
          HttpHeaders.authorizationHeader: mv.jwtToken,
          HttpHeaders.acceptCharsetHeader: 'utf-8',
          HttpHeaders.acceptEncodingHeader: 'utf-8',
          HttpHeaders.contentTypeHeader: 'application/json'
        },
      );

      var responseBody = json.decode(res.body);
      return FetcherResponse(
        status: res.statusCode,
        body: responseBody,
      );
    } on SocketException {
      return FetcherResponse.noInternet();
    } catch (e) {
      print(e);
      return FetcherResponse.unknownReason();
    }
  }
}
