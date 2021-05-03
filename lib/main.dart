import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:rimlines/configs/theme.dart';
import 'package:rimlines/views/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:rimlines/workers/main.dart';

import 'bloc/auth/auth_bloc.dart';
import 'bloc/transaction/transaction_bloc.dart';
import 'constants/auth/main.dart';
import 'models/auth/auth_state.dart';

void main() async {
  await initWorders();
  final storage = new FlutterSecureStorage();
  String jwtToken = await storage.read(key: jwtKey);
  String refreshToken = await storage.read(key: refeshTokenKey);

  print(jwtToken);
  print(refreshToken);

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en')], //, Locale('ar'), Locale('fr')],
      path: 'assets/translations',
      startLocale: Locale('en'),
      fallbackLocale: Locale('en'),
      child: MyApp(
        jwtToken: jwtToken,
        refreshToken: refreshToken,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final String jwtToken;
  final String refreshToken;

  const MyApp({Key key, this.jwtToken, this.refreshToken}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            AuthState(
              jwtToken: jwtToken,
              refreshToken: refreshToken,
            ),
          ),
        ),
        BlocProvider(
          create: (context) => TransactionBloc(context.read<AuthBloc>()),
        ),
      ],
      child: GetMaterialApp(
        title: 'RimLines',
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        theme: lightThemeData(context),
        darkTheme: darkThemeData(context),
        home: MainView(),
      ),
    );
  }
}
