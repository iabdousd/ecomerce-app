import 'package:flutter/material.dart';
import 'package:rimlines/widgets/dashboard-gadgets/balance_counter.dart';
import 'package:rimlines/widgets/dashboard-gadgets/dashboard_header.dart';
import 'package:rimlines/widgets/transaction/transactions_list.dart';

class DepositAgentDashboardPage extends StatefulWidget {
  @override
  _DepositAgentDashboardPageState createState() =>
      _DepositAgentDashboardPageState();
}

class _DepositAgentDashboardPageState extends State<DepositAgentDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: DashboardHeader(),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BalanceCounter(),
                  TransactionList(
                    order: 'by_me',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
