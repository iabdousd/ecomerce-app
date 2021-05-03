import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rimlines/bloc/auth/auth_bloc.dart';
import 'package:rimlines/models/auth/auth_state.dart';

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
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'dashboard.hello'
                          .tr(namedArgs: {'name': state.user.firstName}),
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
            );
          },
        ));
  }
}
