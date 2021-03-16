import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/route_manager.dart';
import 'package:rimlines/configs/ApiConfig.dart';
import 'package:rimlines/models/inspectors/fetcher_response.dart';
import 'package:rimlines/services/shared/feed-back/flush_bar.dart';
import 'package:rimlines/services/shared/feed-back/loader.dart';

import '../FetchInspector.dart';

Future<bool> createOrder(
  String phoneNumber,
  int productId,
  int quantity,
  String note,
) async {
  toggleLoading(state: true);
  FetcherResponse response = await FetchInspector().post(
    path: CREATE_TOPUP_END_POINT,
    body: {
      'phone_number': phoneNumber,
      'product_id': productId,
      'quantity': quantity,
      'note': note,
    },
  );
  toggleLoading(state: false);
  if (response.status == 200) {
    Navigator.of(Get.context).pop();
    showFlushBar(
      title: 'creation.messages.order.success-title'.tr(),
      message: 'creation.messages.order.success-message'.tr(),
      icon: Icon(Icons.check, color: Colors.green[600]),
    );
    return true;
  } else {
    showFlushBar(
      title: 'creation.messages.order.error-title'.tr(),
      message: response.message,
    );
  }
  return false;
}
