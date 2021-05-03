import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rimlines/bloc/auth/auth_bloc.dart';
import 'package:rimlines/models/auth/auth_state.dart';

import 'package:rimlines/services/FetchInspector.dart';
import 'package:rimlines/views/auth-views/login_page.dart';
import 'main-views/main.dart';

class MainView extends StatefulWidget {
  MainView();

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  bool ready = false;
  bool showLogo = false;
  AuthBloc _bloc;

  initialAsync() async {
    if (_bloc.state.jwtToken != null && _bloc.state.jwtToken != '') {
      await FetchInspector().initialize(_bloc.state.jwtToken);
      _bloc.add(Authorized(
        jwtToken: _bloc.state.jwtToken,
        refreshToken: _bloc.state.refreshToken,
      ));
    } else {
      await FetchInspector().initialize(null);
      _bloc.add(UnAuthorized());
    }
  }

  init() async {
    _bloc = BlocProvider.of<AuthBloc>(context);
    setState(() {
      showLogo = true;
    });
    Future initFuture = initialAsync();
    await Future.wait([
      initFuture,
      Future.delayed(
        Duration(seconds: 1),
      ),
    ]);
    setState(() {
      ready = true;
      showLogo = false;
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => init());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Center(
          child: AnimatedOpacity(
            opacity: showLogo ? 1 : 0,
            onEnd: () {
              if (ready) {
                if (_bloc.state.jwtToken != null)
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                else
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
              }
            },
            duration: Duration(milliseconds: 750),
            child: Image.asset(
              'assets/images/logo.png',
              width: 120,
            ),
          ),
        ),
      ),
    );
  }
}
