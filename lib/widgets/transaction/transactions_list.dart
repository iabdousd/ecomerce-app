import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:rimlines/configs/ApiConfig.dart';
import 'package:rimlines/models/inspectors/fetcher_response.dart';
import 'package:rimlines/models/transaction/transaction.dart';
import 'package:rimlines/services/FetchInspector.dart';
import 'package:rimlines/widgets/transaction/transaction_widget.dart';

List<Transaction> transactionsList = [];

class TransactionList extends StatefulWidget {
  final String order;

  const TransactionList({Key key, @required this.order}) : super(key: key);
  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  StreamController<List<Transaction>> transactionsListController =
      StreamController();

  void fetchTransactions() async {
    FetcherResponse response = await FetchInspector().get(
      path: LIST_TOPUPS_END_POINT + '/${widget.order}',
    );
    if (response.status == 200) {
      transactionsList += List<Transaction>.from(response.body
          .map(
            (e) => Transaction.fromJson(e),
          )
          .toList());
      transactionsListController.add(transactionsList);
    }
  }

  @override
  void initState() {
    if (transactionsList.length == 0) fetchTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 8.0,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 12.0,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Color(0x15000000),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            margin: EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                color: Theme.of(context).shadowColor.withOpacity(.5),
                width: 1,
              )),
            ),
            child: Text(
              'transaction.list-title'.tr(),
              style: Theme.of(context).textTheme.headline5.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
            ),
          ),
          StreamBuilder<List<Transaction>>(
            stream: transactionsListController.stream,
            builder: (context, snapshot) {
              return ListView.builder(
                itemCount: transactionsList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return TransactionWidget(
                    transaction: transactionsList[index],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
