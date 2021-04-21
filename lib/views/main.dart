import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:rimlines/services/FetchInspector.dart';
import 'package:rimlines/services/user/main.dart';
import 'package:rimlines/views/auth-views/login_page.dart';
import 'package:rimlines/constants/auth/main.dart';
import 'package:rimlines/configs/memory_veriables.dart' as mv;
import 'main-views/main.dart';

class MainView extends StatefulWidget {
  MainView();

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  bool ready = false;
  bool showLogo = false;

  initialAsync() async {
    final storage = new FlutterSecureStorage();
    String jwtToken = await storage.read(key: jwtKey);
    if (jwtToken != null && jwtToken != '') {
      mv.jwtToken = jwtToken;
      await fetchUser();
    }
  }

  init() async {
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
                if (mv.jwtToken != null)
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
