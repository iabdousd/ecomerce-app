import 'package:flutter/material.dart';

class ToolItemData {
  final String name;
  final VoidCallback tapEvent;
  final Icon icon;

  ToolItemData({
    @required this.name,
    @required this.tapEvent,
    @required this.icon,
  });
}
