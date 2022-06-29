import 'dart:convert';
import 'package:digital_collection/generated/json/base/json_field.dart';
import 'package:digital_collection/generated/json/user_order_detail_entity.g.dart';

@JsonSerializable()
class UserOrderDetailEntity {

	int? code;
	String? message;
	UserOrderDetailData? data;
  
  UserOrderDetailEntity();

  factory UserOrderDetailEntity.fromJson(Map<String, dynamic> json) => $UserOrderDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => $UserOrderDetailEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserOrderDetailData {

	@JSONField(name: "ProductId")
	int? productId;
	@JSONField(name: "OrderId")
	int? orderId;
	@JSONField(name: "UserId")
	int? userId;
	@JSONField(name: "Status")
	int? status;
	@JSONField(name: "StatusName")
	String? statusName;
	@JSONField(name: "ProductName")
	String? productName;
	@JSONField(name: "ProductPhoto")
	String? productPhoto;
	@JSONField(name: "ProductPrice")
	String? productPrice;
	@JSONField(name: "ProductUnit")
	String? productUnit;
	@JSONField(name: "AuthorName")
	String? authorName;
	@JSONField(name: "PayType")
	int? payType;
	@JSONField(name: "PayTime")
	int? payTime;
	@JSONField(name: "Create_At")
	int? createAt;
	@JSONField(name: "Count")
	int? count;
  
  UserOrderDetailData();

  factory UserOrderDetailData.fromJson(Map<String, dynamic> json) => $UserOrderDetailDataFromJson(json);

  Map<String, dynamic> toJson() => $UserOrderDetailDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}