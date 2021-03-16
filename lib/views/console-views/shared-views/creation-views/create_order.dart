import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:rimlines/models/product/Product.dart';
import 'package:rimlines/services/creation/order.dart';
import 'package:rimlines/services/product/main.dart';
import 'package:rimlines/widgets/product/product_picker.dart';
import 'package:rimlines/widgets/shared/forms/AppFormField.dart';

class CreateOrder extends StatefulWidget {
  @override
  _CreateOrderState createState() => _CreateOrderState();
}

class _CreateOrderState extends State<CreateOrder> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  int productId;

  updateProduct(Product product) {
    productId = product.id;
  }

  @override
  initState() {
    fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('creation.order'.tr()),
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
                            return 'form.order.phone.required-msg'.tr();
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'form.order.phone.label'.tr(),
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                          hintText: 'form.order.phone.hint'.tr(),
                        ),
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    ProductPicker(
                      onChoose: updateProduct,
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
                                  return 'form.order.quantity.required-msg'
                                      .tr();
                                }
                                try {
                                  double.parse(value);
                                } catch (e) {
                                  return 'form.order.quantity.invalid-msg'.tr();
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'form.order.quantity.label'.tr(),
                                labelStyle:
                                    Theme.of(context).textTheme.bodyText1,
                                hintText: 'form.order.quantity.hint'.tr(),
                              ),
                              controller: quantityController,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppFormField(
                      label: 'form.order.note.label'.tr(),
                      hint: 'form.order.note.hint'.tr(),
                      controller: noteController,
                      minLines: 3,
                      maxLines: 999,
                      keyboardType: TextInputType.multiline,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'form.order.note.required-msg'.tr();
                        }
                        try {
                          double.parse(value);
                        } catch (e) {
                          return 'form.order.note.invalid-msg'.tr();
                        }
                        return null;
                      },
                    ),
                    FlatButton(
                      onPressed: () => submitOrder(),
                      child: Text('form.order.submit.button-title'.tr()),
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

  void submitOrder() async {
    if (_formKey.currentState.validate())
      await createOrder(
        phoneController.text,
        productId,
        int.parse(quantityController.text),
        noteController.text,
      );
  }
}
