import 'package:flutter/material.dart';

import 'deposit-agent/dashboard.dart';
import 'deposit-agent/creation.dart';
import 'deposit-agent/tools.dart';

Widget getHomePageView(index) {
  // switch (currentUser.role.rolename) {
  //   case "DepositAgent":
  //     {
  switch (index) {
    case 0:
      {
        return DepositAgentDashboardPage();
      }
    case 1:
      {
        return DepositAgentCreationPage();
      }
    case 2:
      {
        return DepositAgentToolsPage();
      }
  }
  //     }
  // }
  return Container();
}
