import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:rimlines/widgets/dashboard-gadgets/app_header.dart';
import 'package:rimlines/widgets/dashboard-gadgets/tool/tool_items.dart';

class DepositAgentToolsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppHeader(title: 'tools.title'.tr()),
          ToolItems(),
        ],
      ),
    );
  }
}
