import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:rimlines/models/product/Product.dart';

class ProductPicker extends StatefulWidget {
  final Function(Product) onChoose;

  const ProductPicker({Key key, this.onChoose}) : super(key: key);
  @override
  _ProductPickerState createState() => _ProductPickerState();
}

class _ProductPickerState extends State<ProductPicker> {
  Product choosenProduct;
  updateChoosen(Product product) {
    choosenProduct = product;
    widget.onChoose(choosenProduct);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: () => showOptions,
        child: Text('form.order.product.label'.tr()),
      ),
    );
  }

  void showOptions() {
    showBottomSheet<Product>(
      context: context,
      builder: (context) {
        return Container(
          child: ValueListenableBuilder(
            valueListenable: Hive.box<Product>(productsBoxname).listenable(),
            builder: (context, Box<Product> box, _) {
              if (box.values.isEmpty) {
                return Text('No products found!');
              } else {
                return ListView.builder(
                  itemCount: box.values.length,
                  itemBuilder: (context, index) {
                    Product product = box.values.toList()[index];
                    return ListTile(
                      onTap: () {
                        if (product.available) {
                          updateChoosen(product);
                          Navigator.of(context).pop();
                        }
                      },
                      tileColor: Theme.of(context)
                          .backgroundColor
                          .withOpacity(product.available ? 1 : 0.75),
                      leading: Image.network(
                        product.imageUrl,
                      ),
                      title: Text(product.title),
                      subtitle: Text(product.price.toStringAsFixed(2) + ' MRU'),
                    );
                  },
                );
              }
            },
          ),
        );
      },
    );
  }
}
