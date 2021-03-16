import 'package:flutter/material.dart';

class CreationItemData {
  final String name;
  final Widget nextView;
  final Icon icon;

  CreationItemData({
    @required this.name,
    @required this.nextView,
    @required this.icon,
  });
}
