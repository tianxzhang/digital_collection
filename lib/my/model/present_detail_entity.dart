import 'dart:convert';
import 'package:digital_collection/generated/json/base/json_field.dart';
import 'package:digital_collection/generated/json/present_detail_entity.g.dart';

@JsonSerializable()
class PresentDetailEntity {

	int? code;
	String? message;
	PresentDetailData? data;
  
  PresentDetailEntity();

  factory PresentDetailEntity.fromJson(Map<String, dynamic> json) => $PresentDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => $PresentDetailEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PresentDetailData {

	@JSONField(name: "OrderId")
	int? orderId;
	@JSONField(name: "Status")
	int? status;
	@JSONField(name: "StatusName")
	String? statusName;
	@JSONField(name: "to_phone")
	String? toPhone;
	@JSONField(name: "ProductName")
	String? productName;
	@JSONField(name: "ProductPhoto")
	String? productPhoto;
	@JSONField(name: "store_num")
	String? storeNum;
	@JSONField(name: "ProductPrice")
	String? productPrice;
	@JSONField(name: "ProductUnit")
	String? productUnit;
  
  PresentDetailData();

  factory PresentDetailData.fromJson(Map<String, dynamic> json) => $PresentDetailDataFromJson(json);

  Map<String, dynamic> toJson() => $PresentDetailDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}