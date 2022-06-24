import 'dart:convert';
import 'package:digital_collection/generated/json/base/json_field.dart';
import 'package:digital_collection/generated/json/collection_entity.g.dart';

@JsonSerializable()
class CollectionEntity {

	int? code;
	String? message;
	CollectionData? data;
  
  CollectionEntity();

  factory CollectionEntity.fromJson(Map<String, dynamic> json) => $CollectionEntityFromJson(json);

  Map<String, dynamic> toJson() => $CollectionEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CollectionData {

	List<CollectionDataList>? list;
  
  CollectionData();

  factory CollectionData.fromJson(Map<String, dynamic> json) => $CollectionDataFromJson(json);

  Map<String, dynamic> toJson() => $CollectionDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CollectionDataList {

	int? id;
	@JSONField(name: "cowry_id")
	int? cowryId;
	@JSONField(name: "product_name")
	String? productName;
	@JSONField(name: "product_cover")
	String? productCover;
	@JSONField(name: "supplier_name")
	String? supplierName;
	@JSONField(name: "meta_name")
	String? metaName;
  
  CollectionDataList();

  factory CollectionDataList.fromJson(Map<String, dynamic> json) => $CollectionDataListFromJson(json);

  Map<String, dynamic> toJson() => $CollectionDataListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}