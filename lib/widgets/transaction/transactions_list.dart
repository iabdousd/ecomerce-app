import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rimlines/bloc/transaction/transaction_bloc.dart';

import 'package:rimlines/models/transaction/transaction_state.dart';
import 'package:rimlines/widgets/transaction/transaction_widget.dart';

class TransactionList extends StatelessWidget {
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
          BlocBuilder<TransactionBloc, TransactionState>(
            bloc: context.read<TransactionBloc>(),
            builder: (context, state) {
              if (state.loading && (state.transactions ?? []).length == 0) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ListView.builder(
                itemCount: state.transactions.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  if (index == state.transactions.length - 1)
                    return Column(
                      children: [
                        TransactionWidget(
                          transaction: state.transactions[index],
                        ),
                        if (state.loading)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(),
                          ),
                      ],
                    );
                  return TransactionWidget(
                    transaction: state.transactions[index],
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
