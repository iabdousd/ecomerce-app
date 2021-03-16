import 'package:flutter/material.dart';

import 'package:rimlines/models/tool/tool_item.dart';
import 'package:rimlines/services/tool/authorities.dart';
import 'tool_item.dart';

class ToolItems extends StatefulWidget {
  const ToolItems({Key key}) : super(key: key);

  @override
  _ToolItemsState createState() => _ToolItemsState();
}

class _ToolItemsState extends State<ToolItems> {
  List<ToolItemData> items;

  initItems() {
    items = getToolItems();
  }

  @override
  void initState() {
    initItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: items
            .map((e) => ToolItemWidget(
                  itemName: e.name,
                  tapEvent: e.tapEvent,
                  icon: e.icon,
                ))
            .toList(),
      ),
    );
  }
}
