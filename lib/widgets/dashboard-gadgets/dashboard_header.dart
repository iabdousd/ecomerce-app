import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:rimlines/configs/memory_veriables.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 20.0,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        boxShadow: [
          BoxShadow(color: Color(0x44000000), blurRadius: 8.0),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'dashboard.hello'
                    .tr(namedArgs: {'name': currentUser.firstName}),
                style: Theme.of(context).textTheme.headline6.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
              ),
              InkWell(
                onTap: () {},
                child: Icon(
                  Icons.notifications_outlined,
                  size: 26,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
