import 'dart:convert';
import 'package:digital_collection/generated/json/base/json_field.dart';
import 'package:digital_collection/generated/json/user_order_entity.g.dart';

@JsonSerializable()
class UserOrderEntity {

	int? code;
	String? message;
	UserOrderData? data;
  
  UserOrderEntity();

  factory UserOrderEntity.fromJson(Map<String, dynamic> json) => $UserOrderEntityFromJson(json);

  Map<String, dynamic> toJson() => $UserOrderEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserOrderData {

	List<UserOrderDataList>? list;
  
  UserOrderData();

  factory UserOrderData.fromJson(Map<String, dynamic> json) => $UserOrderDataFromJson(json);

  Map<String, dynamic> toJson() => $UserOrderDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserOrderDataList {

	int? id;
	@JSONField(name: "ProductId")
	int? productId;
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
	@JSONField(name: "ProductPrice")
	String? productPrice;
	@JSONField(name: "ProductPriceUnit")
	String? productPriceUnit;
	@JSONField(name: "AuthorName")
	String? authorName;
  
  UserOrderDataList();

  factory UserOrderDataList.fromJson(Map<String, dynamic> json) => $UserOrderDataListFromJson(json);

  Map<String, dynamic> toJson() => $UserOrderDataListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}