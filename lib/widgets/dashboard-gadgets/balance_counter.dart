import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:rimlines/configs/memory_veriables.dart' as mv;
import 'package:rimlines/services/balance/main.dart';

class BalanceCounter extends StatefulWidget {
  @override
  _BalanceCounterState createState() => _BalanceCounterState();
}

class _BalanceCounterState extends State<BalanceCounter> {
  asyncInit() async {
    mv.balance = await fetchBalance();
    setState(() {});
  }

  @override
  void initState() {
    asyncInit();
    super.initState();
  }

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              margin: EdgeInsets.only(
                bottom: 8,
              ),
              child: Text(
                'dashboard.balance-title'.tr(),
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              margin: EdgeInsets.only(
                left: 8.0,
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mv.balance.toStringAsFixed(2),
                    style: GoogleFonts.montserrat().merge(
                      Theme.of(context).textTheme.headline4.copyWith(
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
                        Theme.of(context).textTheme.headline5.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
