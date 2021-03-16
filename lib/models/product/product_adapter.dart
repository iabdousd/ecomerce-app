import 'package:hive/hive.dart';

import 'Product.dart';
export 'Product.dart';

class ProductAdapter extends TypeAdapter<Product> {
  @override
  int get typeId => 2;

  @override
  Product read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product(
      id: fields[0] as int,
      title: fields[1] as String,
      imageUrl: fields[2] as String,
      price: fields[3] as double,
      available: fields[4] as bool,
      lastUpdate: fields[5] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.available)
      ..writeByte(5)
      ..write(obj.lastUpdate);
  }
}
