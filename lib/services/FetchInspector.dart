import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:rimlines/configs/ApiConfig.dart';
import 'package:rimlines/models/inspectors/fetcher_response.dart';

class FetchInspector {
  initialize(String jwtToken) async {
    dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        receiveDataWhenStatusError: true,
        headers: {
          HttpHeaders.authorizationHeader: jwtToken,
          HttpHeaders.acceptCharsetHeader: 'utf-8',
          HttpHeaders.acceptEncodingHeader: 'utf-8',
        },
      ),
    );
  }

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
    } on DioError catch (e) {
      print('DIO ERROR: ');
      print(e?.message);
      print(e?.response?.statusCode);
      print(e?.response?.data);
      return FetcherResponse(
        status: e.response?.statusCode ?? 0,
        body: e.response?.data ?? {},
        message: e.response?.data is Map
            ? (e.response?.data ?? {})['non_field_errors'] != null
                ? (e.response?.data ?? {})['non_field_errors'][0].toString()
                : ''
            : e.response?.data.toString() ?? '',
      );
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
    } on DioError catch (e) {
      print('DIO ERROR: ');
      print(e?.message);
      print(e?.response?.statusCode);
      print(e?.response?.data);
      return FetcherResponse(
        status: e.response?.statusCode ?? 0,
        body: e.response?.data ?? {},
        message: e.response?.data is Map
            ? (e.response?.data ?? {})['non_field_errors'] != null
                ? (e.response?.data ?? {})['non_field_errors'][0].toString()
                : ''
            : e.response?.data.toString() ?? '',
      );
    } catch (e) {
      print(e);
      return FetcherResponse.unknownReason();
    }
  }
}
