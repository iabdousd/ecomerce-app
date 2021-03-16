import 'package:flutter/material.dart';

class AppFormField extends StatelessWidget {
  final String label, hint;
  final TextEditingController controller;
  final Function(String) validator;
  final int minLines;
  final int maxLines;
  final TextInputType keyboardType;
  const AppFormField({
    Key key,
    this.label,
    this.hint,
    this.controller,
    this.validator,
    this.minLines = 1,
    this.maxLines = 3,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 16.0,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: TextFormField(
              validator: validator,
              decoration: InputDecoration(
                labelText: label,
                labelStyle: Theme.of(context).textTheme.bodyText1,
                hintText: hint,
              ),
              minLines: minLines,
              maxLines: maxLines,
              controller: controller,
              keyboardType: keyboardType,
            ),
          ),
        ],
      ),
    );
  }
}
