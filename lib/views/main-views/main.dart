import 'dart:async';
import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:rimlines/views/console-views/main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StreamController<int> _pageIndexStreamController;
  PageController _pageController;
  List<Widget> pages = List.generate(
    3,
    (index) => getHomePageView(index),
  );

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageIndexStreamController = StreamController<int>();
    _pageIndexStreamController.add(0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SafeArea(
          child: SizedBox.expand(
            child: PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              children: pages,
            ),
          ),
        ),
        bottomNavigationBar: StreamBuilder<int>(
          stream: _pageIndexStreamController.stream,
          builder: (context, snapshot) {
            return CurvedNavigationBar(
              backgroundColor: Colors.transparent,
              color: Theme.of(context).backgroundColor,
              items: <Widget>[
                Icon(
                  Icons.home,
                  size: 30,
                  color: Theme.of(context).primaryColor,
                ),
                Icon(
                  Icons.add,
                  size: 30,
                  color: Theme.of(context).primaryColor,
                ),
                Icon(
                  Icons.menu,
                  size: 30,
                  color: Theme.of(context).primaryColor,
                ),
              ],
              onTap: (index) {
                _pageController.jumpToPage(index);
                _pageIndexStreamController.add(index);
              },
            );
          },
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Voulez-vous vraiment quitter l\'application?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Non"),
            ),
            TextButton(
              onPressed: () => exit(0),
              style: ButtonStyle(),
              child: Text("Oui"),
            ),
          ],
        );
      },
    );
    return false;
  }
}
