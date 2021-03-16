import 'package:flutter/material.dart';
import 'package:rimlines/models/creation/creation_item.dart';
import 'package:rimlines/services/creation/authorities.dart';
import 'creation_item.dart';

class CreationItems extends StatefulWidget {
  const CreationItems({Key key}) : super(key: key);

  @override
  _CreationItemsState createState() => _CreationItemsState();
}

class _CreationItemsState extends State<CreationItems> {
  List<CreationItemData> items;

  initItems() {
    items = getCreationItems();
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
            .map((e) => CreationItemWidget(
                  itemName: e.name,
                  nextPage: e.nextView,
                  icon: e.icon,
                ))
            .toList(),
      ),
    );
  }
}
