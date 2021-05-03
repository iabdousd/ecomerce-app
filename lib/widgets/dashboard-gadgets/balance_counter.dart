import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:rimlines/bloc/auth/auth_bloc.dart';

import 'package:rimlines/models/auth/auth_state.dart';

class BalanceCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            boxShadow: [
              BoxShadow(
                color: Color(0x11000000),
                blurRadius: 8,
              ),
            ],
            borderRadius: BorderRadius.circular(12.0),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 16.0,
          ),
          margin: EdgeInsets.symmetric(
            vertical: 12.0,
          ),
          width: MediaQuery.of(context).size.width - 32.0,
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state.loading)
                return Center(
                  child: CircularProgressIndicator(),
                );
              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                margin: EdgeInsets.only(
                  left: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              bottom: 8,
                            ),
                            child: Text(
                              'dashboard.balance-title'.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(
                                    fontWeight: FontWeight.w900,
                                  ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                state.balance?.toStringAsFixed(2) ?? '',
                                style: GoogleFonts.montserrat().merge(
                                  Theme.of(context)
                                      .textTheme
                                      .headline4
                                      .copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 4.0),
                                child: Text(
                                  " MRU",
                                  style: GoogleFonts.montserrat().merge(
                                    Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith(
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'COUNT',
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        Text(
                          '${state.transactionsCount}',
                          style: Theme.of(context).textTheme.headline5.copyWith(
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).primaryColor,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          )),
    );
  }
}
