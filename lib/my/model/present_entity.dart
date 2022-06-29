import 'dart:convert';
import 'package:digital_collection/generated/json/base/json_field.dart';
import 'package:digital_collection/generated/json/present_entity.g.dart';

@JsonSerializable()
class PresentEntity {

	int? code;
	String? message;
	PresentData? data;
  
  PresentEntity();

  factory PresentEntity.fromJson(Map<String, dynamic> json) => $PresentEntityFromJson(json);

  Map<String, dynamic> toJson() => $PresentEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PresentData {

	@JSONField(name: "ProductName")
	String? productName;
	@JSONField(name: "ProductPhoto")
	String? productPhoto;
	@JSONField(name: "AuthorName")
	String? authorName;
	@JSONField(name: "ProductPrice")
	String? productPrice;
	@JSONField(name: "ProductUnit")
	String? productUnit;
	@JSONField(name: "DescList")
	String? descList;
	@JSONField(name: "HashId")
	String? hashId;
	@JSONField(name: "ConvertType")
	int? convertType;
  
  PresentData();

  factory PresentData.fromJson(Map<String, dynamic> json) => $PresentDataFromJson(json);

  Map<String, dynamic> toJson() => $PresentDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}