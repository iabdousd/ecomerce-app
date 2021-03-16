import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rimlines/models/product/product_adapter.dart';

Future<void> initHive() async {
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(ProductAdapter().typeId))
    Hive.registerAdapter(ProductAdapter());
  if (!Hive.isBoxOpen(productsBoxname))
    await Hive.openBox<Product>(productsBoxname);
}
