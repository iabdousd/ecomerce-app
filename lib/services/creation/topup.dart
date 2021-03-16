import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rimlines/configs/ApiConfig.dart';

import 'package:rimlines/models/inspectors/fetcher_response.dart';
import 'package:rimlines/services/FetchInspector.dart';
import 'package:rimlines/services/shared/feed-back/flush_bar.dart';
import 'package:rimlines/services/shared/feed-back/loader.dart';

Future<bool> createTopup(String phone, double amount, context) async {
  toggleLoading(state: true);
  FetcherResponse response = await FetchInspector().post(
    path: CREATE_TOPUP_END_POINT,
    body: {
      'phone_number': phone,
      'amount': amount,
    },
  );
  toggleLoading(state: false);
  if (response.status == 200) {
    // SUCCEED !
    // if (succeed)
    Navigator.of(context).pop();
    showFlushBar(
      title: 'creation.messages.topup.success-title'.tr(),
      message: 'creation.messages.topup.success-message'.tr(),
      icon: Icon(Icons.check, color: Colors.green[600]),
    );
    return true;
  } else {
    showFlushBar(
      title: 'creation.messages.topup.error-title'.tr(),
      message: response.message,
    );
  }
  return false;
}
