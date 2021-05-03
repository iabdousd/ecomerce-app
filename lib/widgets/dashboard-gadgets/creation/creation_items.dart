import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rimlines/bloc/auth/auth_bloc.dart';
import 'package:rimlines/bloc/transaction/transaction_bloc.dart';
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
    setState(() {
      items = getCreationItems(
        context.read<AuthBloc>().state.user.role.rolename,
      );
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initItems();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: items == null
            ? [
                Center(
                  child: CircularProgressIndicator(),
                ),
              ]
            : items
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
