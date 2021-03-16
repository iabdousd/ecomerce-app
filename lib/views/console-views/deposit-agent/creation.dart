import 'package:flutter/material.dart';
import 'package:rimlines/widgets/dashboard-gadgets/creation/creation_items.dart';
import 'package:rimlines/widgets/dashboard-gadgets/creation_header.dart';

class DepositAgentCreationPage extends StatelessWidget {
  const DepositAgentCreationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CreationHeader(),
            CreationItems(),
          ],
        ),
      ),
    );
  }
}
