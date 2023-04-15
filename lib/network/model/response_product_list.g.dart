// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_product_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseProductList _$ResponseProductListFromJson(Map<String, dynamic> json) =>
    ResponseProductList(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ResponseDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPaging: json['nextPaging'] as int?,
    );

Map<String, dynamic> _$ResponseProductListToJson(
        ResponseProductList instance) =>
    <String, dynamic>{
      'data': instance.data,
      'nextPaging': instance.nextPaging,
    };

ResponseDatum _$ResponseDatumFromJson(Map<String, dynamic> json) =>
    ResponseDatum(
      id: json['id'] as int?,
      category: json['category'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      price: json['price'] as int?,
      texture: json['texture'] as String?,
      wash: json['wash'] as String?,
      place: json['place'] as String?,
      note: json['note'] as String?,
      story: json['story'] as String?,
      mainImage: json['mainImage'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      variants: (json['variants'] as List<dynamic>?)
          ?.map((e) => ResponseVariant.fromJson(e as Map<String, dynamic>))
          .toList(),
      colors: (json['colors'] as List<dynamic>?)
          ?.map((e) => ResponseColor.fromJson(e as Map<String, dynamic>))
          .toList(),
      sizes: (json['sizes'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$ResponseSizeEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$ResponseDatumToJson(ResponseDatum instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'texture': instance.texture,
      'wash': instance.wash,
      'place': instance.place,
      'note': instance.note,
      'story': instance.story,
      'mainImage': instance.mainImage,
      'images': instance.images,
      'variants': instance.variants,
      'colors': instance.colors,
      'sizes': instance.sizes?.map((e) => _$ResponseSizeEnumMap[e]!).toList(),
    };

const _$ResponseSizeEnumMap = {
  ResponseSize.S: 'S',
  ResponseSize.M: 'M',
  ResponseSize.L: 'L',
  ResponseSize.XL: 'XL',
};

ResponseColor _$ResponseColorFromJson(Map<String, dynamic> json) =>
    ResponseColor(
      code: json['code'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ResponseColorToJson(ResponseColor instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
    };

ResponseVariant _$ResponseVariantFromJson(Map<String, dynamic> json) =>
    ResponseVariant(
      colorCode: json['colorCode'] as String?,
      size: $enumDecodeNullable(_$ResponseSizeEnumMap, json['size']),
      stock: json['stock'] as int?,
    );

Map<String, dynamic> _$ResponseVariantToJson(ResponseVariant instance) =>
    <String, dynamic>{
      'colorCode': instance.colorCode,
      'size': _$ResponseSizeEnumMap[instance.size],
      'stock': instance.stock,
    };
