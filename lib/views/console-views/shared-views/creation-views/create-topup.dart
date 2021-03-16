import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:rimlines/services/creation/topup.dart';
import 'package:rimlines/services/shared/feed-back/loader.dart';

class CreateTopup extends StatefulWidget {
  @override
  _CreateTopupState createState() => _CreateTopupState();
}

class _CreateTopupState extends State<CreateTopup> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('creation.topup'.tr()),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Form
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 16.0,
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'form.topup.phone.required-msg'.tr();
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'form.topup.phone.label'.tr(),
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                          hintText: 'form.topup.phone.hint'.tr(),
                        ),
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    Container(
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
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'form.topup.amount.required-msg'.tr();
                                }
                                try {
                                  double.parse(value);
                                } catch (e) {
                                  return 'form.topup.amount.invalid-msg'.tr();
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'form.topup.amount.label'.tr(),
                                labelStyle:
                                    Theme.of(context).textTheme.bodyText1,
                                hintText: 'form.topup.amount.hint'.tr(),
                              ),
                              controller: amountController,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              bottom: 8.0,
                            ),
                            child: Text(
                              "  MRU",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    FlatButton(
                      onPressed: () => submitTopup(),
                      child: Text('form.topup.submit.button-title'.tr()),
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(16.0),
                      minWidth: MediaQuery.of(context).size.width - 18,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void submitTopup() async {
    await createTopup(
      phoneController.text,
      double.parse(amountController.text),
      context,
    );
  }
}
