import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreationItemWidget extends StatelessWidget {
  final String itemName;
  final Widget nextPage;
  final Icon icon;

  const CreationItemWidget({
    Key key,
    @required this.itemName,
    @required this.nextPage,
    @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Color(0x22000000),
            blurRadius: 8,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: ListTile(
        onTap: () => Get.to(
          () => nextPage,
          popGesture: true,
        ),
        leading: icon,
        title: Container(
          child: Text(
            itemName,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
