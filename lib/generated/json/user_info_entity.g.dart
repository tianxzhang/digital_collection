import 'package:digital_collection/generated/json/base/json_convert_content.dart';
import 'package:digital_collection/my/model/user_info_entity.dart';

UserInfoEntity $UserInfoEntityFromJson(Map<String, dynamic> json) {
	final UserInfoEntity userInfoEntity = UserInfoEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		userInfoEntity.code = code;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		userInfoEntity.message = message;
	}
	final UserInfoData? data = jsonConvert.convert<UserInfoData>(json['data']);
	if (data != null) {
		userInfoEntity.data = data;
	}
	return userInfoEntity;
}

Map<String, dynamic> $UserInfoEntityToJson(UserInfoEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

UserInfoData $UserInfoDataFromJson(Map<String, dynamic> json) {
	final UserInfoData userInfoData = UserInfoData();
	final String? phone = jsonConvert.convert<String>(json['phone']);
	if (phone != null) {
		userInfoData.phone = phone;
	}
	final String? nickName = jsonConvert.convert<String>(json['nickName']);
	if (nickName != null) {
		userInfoData.nickName = nickName;
	}
	final String? address = jsonConvert.convert<String>(json['address']);
	if (address != null) {
		userInfoData.address = address;
	}
	final String? photo = jsonConvert.convert<String>(json['photo']);
	if (photo != null) {
		userInfoData.photo = photo;
	}
	return userInfoData;
}

Map<String, dynamic> $UserInfoDataToJson(UserInfoData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['phone'] = entity.phone;
	data['nickName'] = entity.nickName;
	data['address'] = entity.address;
	data['photo'] = entity.photo;
	return data;
}