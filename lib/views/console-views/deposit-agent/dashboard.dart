import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rimlines/bloc/transaction/transaction_bloc.dart';
import 'package:rimlines/models/transaction/transaction_state.dart';

import 'package:rimlines/widgets/dashboard-gadgets/balance_counter.dart';
import 'package:rimlines/widgets/dashboard-gadgets/dashboard_header.dart';
import 'package:rimlines/widgets/transaction/transactions_list.dart';

class DepositAgentDashboardPage extends StatefulWidget {
  @override
  _DepositAgentDashboardPageState createState() =>
      _DepositAgentDashboardPageState();
}

class _DepositAgentDashboardPageState extends State<DepositAgentDashboardPage> {
  final _scrollController = ScrollController();
  TransactionBloc _bloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc = context.read<TransactionBloc>();
      _bloc.add(FetchedTransactions());
      _scrollController.addListener(() {
        if (!context.read<TransactionBloc>().state.loading &&
            (!context.read<TransactionBloc>().state.reachedLimit ?? false) &&
            _scrollController.offset >
                _scrollController.position.maxScrollExtent - 20)
          _bloc.add(FetchedMoreTransactions());
      });
    });
  }

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
              controller: _scrollController,
              child: Column(
                children: [
                  BalanceCounter(),
                  TransactionList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
