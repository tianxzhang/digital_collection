import 'dart:convert';
import 'package:digital_collection/generated/json/base/json_field.dart';
import 'package:digital_collection/generated/json/product_detail_entity.g.dart';

@JsonSerializable()
class ProductDetailEntity {

	int? code;
	String? message;
	ProductDetailData? data;
  
  ProductDetailEntity();

  factory ProductDetailEntity.fromJson(Map<String, dynamic> json) => $ProductDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => $ProductDetailEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ProductDetailData {

	ProductDetailDataInfo? info;
	int? status;
	int? serverTime;
  
  ProductDetailData();

  factory ProductDetailData.fromJson(Map<String, dynamic> json) => $ProductDetailDataFromJson(json);

  Map<String, dynamic> toJson() => $ProductDetailDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ProductDetailDataInfo {

	int? id;
	@JSONField(name: "product_name")
	String? productName;
	String? placeholder;
	@JSONField(name: "supplier_id")
	int? supplierId;
	@JSONField(name: "supplier_photo")
	String? supplierPhoto;
	@JSONField(name: "supplier_name")
	String? supplierName;
	@JSONField(name: "supplier_desc")
	String? supplierDesc;
	@JSONField(name: "price_string")
	String? priceString;
	@JSONField(name: "price_unit")
	String? priceUnit;
	@JSONField(name: "sell_count")
	int? sellCount;
	@JSONField(name: "sell_time")
	int? sellTime;
	@JSONField(name: "product_desc_image")
	List<String>? productDescImage;
	@JSONField(name: "product_image")
	List<String>? productImage;
	@JSONField(name: "buy_notes")
	String? buyNotes;
	@JSONField(name: "one_category_id")
	int? oneCategoryId;
	@JSONField(name: "product_is_3d")
	bool? productIs3d;
  
  ProductDetailDataInfo();

  factory ProductDetailDataInfo.fromJson(Map<String, dynamic> json) => $ProductDetailDataInfoFromJson(json);

  Map<String, dynamic> toJson() => $ProductDetailDataInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}