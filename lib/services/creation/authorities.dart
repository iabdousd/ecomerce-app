import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:rimlines/configs/memory_veriables.dart';
import 'package:rimlines/models/creation/creation_item.dart';
import 'package:rimlines/views/console-views/shared-views/creation-views/create-topup.dart';
import 'package:rimlines/views/console-views/shared-views/creation-views/create_order.dart';

final List<CreationItemData> sharedItems = [];

final depositAgentItems = [
  CreationItemData(
    name: 'creation.topup'.tr(),
    nextView: CreateTopup(),
    icon: Icon(Icons.payments_outlined),
  ),
];

final storeAgentItems = [
  CreationItemData(
    name: 'creation.order'.tr(),
    nextView: CreateOrder(),
    icon: Icon(Icons.calendar_view_day_outlined),
  ),
  // CreationItemData(
  //   name: 'creation.bank-deposit'.tr(),
  //   nextView: CreateBankDeposit(),
  //   icon: Icon(Icons.attach_money_rounded),
  // ),
];

final customersAgentItems = [
  CreationItemData(
    name: 'creation.order'.tr(),
    nextView: CreateOrder(),
    icon: Icon(Icons.calendar_view_day_outlined),
  ),
  // CreationItemData(
  //   name: 'creation.late-topup-report'.tr(),
  //   nextView: CreateTopupReport(),
  //   icon: Icon(Icons.report_gmailerrorred_rounded),
  // ),
];

final ordersFulfillerItems = [
  // CreationItemData(
  //   name: 'creation.order-mistake-report'.tr(),
  //   nextView: CreateOrderMistakeReport(),
  //   icon: Icon(Icons.report_gmailerrorred_rounded),
  // ),
];

final adminItems = [
  CreationItemData(
    name: 'creation.topup'.tr(),
    nextView: CreateTopup(),
    icon: Icon(Icons.payments_outlined),
  ),
  CreationItemData(
    name: 'creation.order'.tr(),
    nextView: CreateOrder(),
    icon: Icon(Icons.calendar_view_day_outlined),
  ),
  // CreationItemData(
  //   name: 'creation.bank-deposit'.tr(),
  //   nextView: CreateBankDeposit(),
  //   icon: Icon(Icons.attach_money_rounded),
  // ),
];

List<CreationItemData> getCreationItems() {
  switch (currentUser.role.rolename) {
    case "DEPOSIT_AGENT":
      {
        // return sharedItems + depositAgentItems;
        return sharedItems + customersAgentItems;
      }
    case "STORE_AGENT":
      {
        return sharedItems + storeAgentItems;
      }
    case "CUSTOMERS_AGENT":
      {
        return sharedItems + customersAgentItems;
      }
    case "ORDERS_FULFILLER":
      {
        return sharedItems + ordersFulfillerItems;
      }
    case "ADMIN":
      {
        return sharedItems + adminItems;
      }
  }
  return [];
}
