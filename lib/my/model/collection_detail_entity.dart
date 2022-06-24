import 'dart:convert';
import 'package:digital_collection/generated/json/base/json_field.dart';
import 'package:digital_collection/generated/json/collection_detail_entity.g.dart';

@JsonSerializable()
class CollectionDetailEntity {

	int? code;
	String? message;
	CollectionDetailData? data;
  
  CollectionDetailEntity();

  factory CollectionDetailEntity.fromJson(Map<String, dynamic> json) => $CollectionDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => $CollectionDetailEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CollectionDetailData {

	@JSONField(name: "product_name")
	String? productName;
	@JSONField(name: "product_image")
	String? productImage;
	@JSONField(name: "supplier_name")
	String? supplierName;
	@JSONField(name: "hash_id")
	String? hashId;
	@JSONField(name: "contract_id")
	String? contractId;
	@JSONField(name: "meta_name")
	String? metaName;
	@JSONField(name: "block_name")
	String? blockName;
	@JSONField(name: "create_time")
	int? createTime;
	@JSONField(name: "collector_name")
	String? collectorName;
	@JSONField(name: "store_is_convert")
	bool? storeIsConvert;
	@JSONField(name: "store_convert_type")
	int? storeConvertType;
	@JSONField(name: "product_is_3d")
	bool? productIs3d;
  
  CollectionDetailData();

  factory CollectionDetailData.fromJson(Map<String, dynamic> json) => $CollectionDetailDataFromJson(json);

  Map<String, dynamic> toJson() => $CollectionDetailDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}