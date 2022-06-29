import 'dart:convert';
import 'package:digital_collection/generated/json/base/json_field.dart';
import 'package:digital_collection/generated/json/present_record_entity.g.dart';

@JsonSerializable()
class PresentRecordEntity {

	int? code;
	String? message;
	PresentRecordData? data;
  
  PresentRecordEntity();

  factory PresentRecordEntity.fromJson(Map<String, dynamic> json) => $PresentRecordEntityFromJson(json);

  Map<String, dynamic> toJson() => $PresentRecordEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PresentRecordData {

	List<PresentRecordDataList>? list;
  
  PresentRecordData();

  factory PresentRecordData.fromJson(Map<String, dynamic> json) => $PresentRecordDataFromJson(json);

  Map<String, dynamic> toJson() => $PresentRecordDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PresentRecordDataList {

	int? id;
	@JSONField(name: "OrderId")
	int? orderId;
	@JSONField(name: "Status")
	int? status;
	@JSONField(name: "StatusName")
	String? statusName;
	@JSONField(name: "ProductName")
	String? productName;
	@JSONField(name: "ProductPhoto")
	String? productPhoto;
	@JSONField(name: "AuthorName")
	String? authorName;
	@JSONField(name: "ToPhone")
	String? toPhone;
	@JSONField(name: "CowryNum")
	String? cowryNum;
  
  PresentRecordDataList();

  factory PresentRecordDataList.fromJson(Map<String, dynamic> json) => $PresentRecordDataListFromJson(json);

  Map<String, dynamic> toJson() => $PresentRecordDataListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}