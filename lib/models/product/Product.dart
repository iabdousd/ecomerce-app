import 'package:hive/hive.dart';

String productsBoxname = 'products_box';

@HiveType(typeId: 0)
class Product extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String imageUrl;
  @HiveField(3)
  double price;
  @HiveField(4)
  bool available;
  @HiveField(5)
  DateTime lastUpdate;

  Product({
    this.id,
    this.title,
    this.imageUrl,
    this.price,
    this.available,
    this.lastUpdate,
  });

  Product.fromJson(Map<String, dynamic> productsObjects) {
    this.id = productsObjects['id'];
    this.title = productsObjects['title'];
    this.imageUrl = productsObjects['imageUrl'];
    this.price = productsObjects['price'];
    this.available = productsObjects['available'];
    this.lastUpdate = DateTime.parse(productsObjects['date']);
  }
}
