import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:rimlines/models/tool/tool_item.dart';
import 'package:rimlines/services/auth/logout.dart';

getToolItems(String rolename) {
  switch (rolename) {
    case "Admin":
      {
        return [
          ToolItemData(
            name: 'tools.disconnect'.tr(),
            tapEvent: signOut,
            icon: Icon(Icons.outbond_rounded),
          ),
        ];
      }
  }
  return [
    ToolItemData(
      name: 'tools.disconnect'.tr(),
      tapEvent: signOut,
      icon: Icon(Icons.outbond_rounded),
    ),
  ];
}
