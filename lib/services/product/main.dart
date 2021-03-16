import 'package:hive/hive.dart';
import 'package:rimlines/configs/ApiConfig.dart';

import 'package:rimlines/models/product/Product.dart';
import 'package:rimlines/models/inspectors/fetcher_response.dart';
import 'package:rimlines/services/FetchInspector.dart';

saveProduct(Product product) async {
  await Hive.box<Product>(productsBoxname).put(product.id, product);
}

fetchProducts() async {
  List productsObjects = [];
  int lastUpdate = Hive.box<Product>(productsBoxname).keys.length > 0
      ? Hive.box<Product>(productsBoxname)
          .get(Hive.box<Product>(productsBoxname).keys.last)
          .lastUpdate
          .toUtc()
          .millisecondsSinceEpoch
      : 0;
  FetcherResponse response = await FetchInspector().get(
    path: LIST_PRODUCTS_END_POINT + '?timestamp=$lastUpdate',
  );
  print(response.status);
  print(response.body);
  if (response.status == 200) {
    productsObjects += List<Product>.from(
      response.body
          .map(
            (e) => Product.fromJson(e),
          )
          .toList(),
    );
    for (var productObject in productsObjects) {
      await saveProduct(Product.fromJson(productObject));
    }
  }
}
