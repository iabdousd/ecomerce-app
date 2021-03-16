import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class AppHeader extends StatelessWidget {
  final String title;

  const AppHeader({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Color(0x22000000),
            blurRadius: 8.0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        title.tr(),
        style: Theme.of(context)
            .textTheme
            .headline6
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
