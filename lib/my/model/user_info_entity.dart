import 'dart:convert';
import 'package:digital_collection/generated/json/base/json_field.dart';
import 'package:digital_collection/generated/json/user_info_entity.g.dart';

@JsonSerializable()
class UserInfoEntity {

	int? code;
	String? message;
	UserInfoData? data;
  
  UserInfoEntity();

  factory UserInfoEntity.fromJson(Map<String, dynamic> json) => $UserInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserInfoData {

	String? phone;
	String? nickName;
	String? address;
	String? photo;
  
  UserInfoData();

  factory UserInfoData.fromJson(Map<String, dynamic> json) => $UserInfoDataFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}