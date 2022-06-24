import 'dart:convert';
import 'package:digital_collection/generated/json/base/json_field.dart';
import 'package:digital_collection/generated/json/production_list_entity.g.dart';

@JsonSerializable()
class ProductionListEntity {

	int? code;
	String? message;
	ProductionListData? data;
  
  ProductionListEntity();

  factory ProductionListEntity.fromJson(Map<String, dynamic> json) => $ProductionListEntityFromJson(json);

  Map<String, dynamic> toJson() => $ProductionListEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ProductionListData {

	List<ProductionListDataProducts>? products;
	int? serverTime;
	dynamic bannerList;
  
  ProductionListData();

  factory ProductionListData.fromJson(Map<String, dynamic> json) => $ProductionListDataFromJson(json);

  Map<String, dynamic> toJson() => $ProductionListDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ProductionListDataProducts {

	int? id;
	@JSONField(name: "product_name")
	String? productName;
	String? placeholder;
	@JSONField(name: "one_category_id")
	int? oneCategoryId;
	@JSONField(name: "supplier_id")
	int? supplierId;
	@JSONField(name: "supplier_name")
	String? supplierName;
	@JSONField(name: "supplier_photo")
	String? supplierPhoto;
	@JSONField(name: "price_string")
	String? priceString;
	@JSONField(name: "price_unit")
	String? priceUnit;
	@JSONField(name: "sell_count")
	int? sellCount;
	@JSONField(name: "sell_time")
	int? sellTime;
	int? status;
  
  ProductionListDataProducts();

  factory ProductionListDataProducts.fromJson(Map<String, dynamic> json) => $ProductionListDataProductsFromJson(json);

  Map<String, dynamic> toJson() => $ProductionListDataProductsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}