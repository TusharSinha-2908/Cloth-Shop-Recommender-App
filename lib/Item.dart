
final String tableItems = 'items';

class ItemFields{

  static final List<String> values = [
    // Add All Fields
    id, size, gender, garment, price, shop ];

  static final String id = '_id';
  static final String size = 'size';
  static final String gender = 'gender';
  static final String garment = 'garment';
  static final String price = 'price';
  static final String shop = 'shop';

}

class Item{

  final int? id;
  final String? size;
  final String? gender;
  final String? garment;
  final int? price;
  final String? shop;

  const Item({
    required this.id,
    required this.size,
    required this.gender,
    required this.garment,
    required this.price,
    required this.shop,
  });

  Item copy({
    int? id,
    String? size,
    String? gender,
    String? garment,
    int? price,
    String? shop,
  }) =>
  Item(
    id: id ?? this.id,
    size: size ?? this.size,
    gender: gender ?? this.gender,
    garment: garment ?? this.garment,
    price: price ?? this.price,
    shop: shop ?? this.shop,
  );

  Map<String, Object?> toJson() =>{
    ItemFields.id: id,
    ItemFields.size: size,
    ItemFields.gender: gender,
    ItemFields.garment: garment,
    ItemFields.price: price,
    ItemFields.shop: shop,
  };

  static Item fromJson(Map<String?, Object?> json) => Item(
    id: json[ItemFields.id] as int?,
    size: json[ItemFields.size] as String?,
    gender: json[ItemFields.gender] as String?,
    garment: json[ItemFields.garment] as String?,
    price: json[ItemFields.price] as int?,
    shop: json[ItemFields.shop] as String?,
  );

}