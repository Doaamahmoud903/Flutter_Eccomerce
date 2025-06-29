// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cart_response_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GetCartResponseEntityAdapter extends TypeAdapter<GetCartResponseEntity> {
  @override
  final int typeId = 3;

  @override
  GetCartResponseEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetCartResponseEntity(
      status: fields[0] as String?,
      message: fields[1] as String?,
      numOfCartItems: fields[2] as num?,
      cartId: fields[3] as String?,
      data: fields[4] as GetCartDataEntity?,
    );
  }

  @override
  void write(BinaryWriter writer, GetCartResponseEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.numOfCartItems)
      ..writeByte(3)
      ..write(obj.cartId)
      ..writeByte(4)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetCartResponseEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GetCartDataEntityAdapter extends TypeAdapter<GetCartDataEntity> {
  @override
  final int typeId = 4;

  @override
  GetCartDataEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetCartDataEntity(
      id: fields[0] as String?,
      cartOwner: fields[1] as String?,
      products: (fields[2] as List?)?.cast<GetCartProductsEntity>(),
      totalCartPrice: fields[3] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, GetCartDataEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.cartOwner)
      ..writeByte(2)
      ..write(obj.products)
      ..writeByte(3)
      ..write(obj.totalCartPrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetCartDataEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GetCartProductsEntityAdapter extends TypeAdapter<GetCartProductsEntity> {
  @override
  final int typeId = 5;

  @override
  GetCartProductsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetCartProductsEntity(
      cartItemId: fields[11] as String?,
      subcategory: (fields[0] as List?)?.cast<GetSubcategoryEntity>(),
      id: fields[1] as String?,
      title: fields[3] as String?,
      quantity: fields[4] as num?,
      imageCover: fields[5] as String?,
      category: fields[6] as GetCategoryEntity?,
      brand: fields[7] as GetBrandEntity?,
      ratingsAverage: fields[8] as num?,
      price: fields[9] as num?,
      count: fields[10] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, GetCartProductsEntity obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.subcategory)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.quantity)
      ..writeByte(5)
      ..write(obj.imageCover)
      ..writeByte(6)
      ..write(obj.category)
      ..writeByte(7)
      ..write(obj.brand)
      ..writeByte(8)
      ..write(obj.ratingsAverage)
      ..writeByte(9)
      ..write(obj.price)
      ..writeByte(10)
      ..write(obj.count)
      ..writeByte(11)
      ..write(obj.cartItemId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetCartProductsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GetBrandEntityAdapter extends TypeAdapter<GetBrandEntity> {
  @override
  final int typeId = 6;

  @override
  GetBrandEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetBrandEntity(
      id: fields[0] as String?,
      name: fields[1] as String?,
      slug: fields[2] as String?,
      image: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GetBrandEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.slug)
      ..writeByte(3)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetBrandEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GetCategoryEntityAdapter extends TypeAdapter<GetCategoryEntity> {
  @override
  final int typeId = 7;

  @override
  GetCategoryEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetCategoryEntity(
      id: fields[0] as String?,
      name: fields[1] as String?,
      slug: fields[2] as String?,
      image: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GetCategoryEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.slug)
      ..writeByte(3)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetCategoryEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GetSubcategoryEntityAdapter extends TypeAdapter<GetSubcategoryEntity> {
  @override
  final int typeId = 8;

  @override
  GetSubcategoryEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetSubcategoryEntity(
      id: fields[0] as String?,
      name: fields[1] as String?,
      slug: fields[2] as String?,
      category: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GetSubcategoryEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.slug)
      ..writeByte(3)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetSubcategoryEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
