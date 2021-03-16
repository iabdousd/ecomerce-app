import 'package:flutter/foundation.dart';
import 'package:easy_localization/easy_localization.dart';

class FetcherResponse {
  final int status;
  String message;
  final body;

  FetcherResponse({@required this.status, this.message, this.body});

  FetcherResponse.noInternet({
    this.status = 0,
    this.message = '',
    this.body,
  });
  FetcherResponse.unknownReason({
    this.status = -1,
    message,
    this.body,
  }) {
    this.message = message ?? 'errors.unknown'.tr();
  }
}
