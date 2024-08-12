// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_product_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderProductEntityAdapter extends TypeAdapter<OrderProductEntity> {
  @override
  final int typeId = 4;

  @override
  OrderProductEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderProductEntity(
      productUid: fields[0] as int,
      productQuantity: fields[1] as int,
      productPrice: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, OrderProductEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.productUid)
      ..writeByte(1)
      ..write(obj.productQuantity)
      ..writeByte(2)
      ..write(obj.productPrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderProductEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
