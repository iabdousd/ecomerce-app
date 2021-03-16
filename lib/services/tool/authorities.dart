import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:rimlines/configs/memory_veriables.dart';
import 'package:rimlines/models/tool/tool_item.dart';
import 'package:rimlines/services/auth/logout.dart';

getToolItems() {
  switch (currentUser.role.rolename) {
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
