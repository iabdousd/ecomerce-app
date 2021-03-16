import 'package:easy_localization/easy_localization.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:rimlines/models/transaction/transaction.dart';

class TransactionWidget extends StatefulWidget {
  final Transaction transaction;

  const TransactionWidget({Key key, @required this.transaction})
      : super(key: key);

  @override
  _TransactionWidgetState createState() => _TransactionWidgetState();
}

class _TransactionWidgetState extends State<TransactionWidget> {
  bool expanded = false;
  tapEvent() {
    setState(() {
      expanded = !expanded;
    });
  }

  cancelTransaction() async {
    Navigator.of(context).pop();
  }

  cancelAction() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("transaction.cancel.alert-title".tr()),
          content: Text("transaction.cancel.alert-content".tr()),
          actions: [
            RaisedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("transaction.cancel.cancel".tr()),
              color: Theme.of(context).backgroundColor,
            ),
            RaisedButton(
              onPressed: cancelTransaction,
              child: Text("transaction.cancel.submit".tr()),
              color: Colors.red[400],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate =
        DateFormat('dd-MM-yyyy hh:mm').format(widget.transaction.date);

    return InkWell(
      onTap: tapEvent,
      onLongPress: cancelAction,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.symmetric(
          vertical: 12.0,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 8.0,
        ),
        height: expanded ? 120 : 80,
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Color(0x33000000),
              blurRadius: 6,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 64,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Text(
                  //   "#${widget.transaction.id}",
                  //   style: Theme.of(context).textTheme.headline5,
                  // ),
                  SizedBox(
                    width: 12.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.transaction.title,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(fontSize: 16.0),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        formattedDate,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ],
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "+" + widget.transaction.amount.toStringAsFixed(2),
                        style: Theme.of(context).textTheme.subtitle2.copyWith(
                              color: Colors.green,
                              fontWeight: FontWeight.w700,
                              fontSize: 14.0,
                            ),
                      ),
                      Text(
                        "MRU",
                        style: Theme.of(context).textTheme.subtitle2.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 14.0,
                            ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: RaisedButton(
                onPressed: cancelAction,
                child: Text(
                  'transaction.cancel.button-title'.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                color: Colors.red[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
