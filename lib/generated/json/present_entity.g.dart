import 'package:digital_collection/generated/json/base/json_convert_content.dart';
import 'package:digital_collection/my/model/present_entity.dart';

PresentEntity $PresentEntityFromJson(Map<String, dynamic> json) {
	final PresentEntity presentEntity = PresentEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		presentEntity.code = code;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		presentEntity.message = message;
	}
	final PresentData? data = jsonConvert.convert<PresentData>(json['data']);
	if (data != null) {
		presentEntity.data = data;
	}
	return presentEntity;
}

Map<String, dynamic> $PresentEntityToJson(PresentEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

PresentData $PresentDataFromJson(Map<String, dynamic> json) {
	final PresentData presentData = PresentData();
	final String? productName = jsonConvert.convert<String>(json['ProductName']);
	if (productName != null) {
		presentData.productName = productName;
	}
	final String? productPhoto = jsonConvert.convert<String>(json['ProductPhoto']);
	if (productPhoto != null) {
		presentData.productPhoto = productPhoto;
	}
	final String? authorName = jsonConvert.convert<String>(json['AuthorName']);
	if (authorName != null) {
		presentData.authorName = authorName;
	}
	final String? productPrice = jsonConvert.convert<String>(json['ProductPrice']);
	if (productPrice != null) {
		presentData.productPrice = productPrice;
	}
	final String? productUnit = jsonConvert.convert<String>(json['ProductUnit']);
	if (productUnit != null) {
		presentData.productUnit = productUnit;
	}
	final String? descList = jsonConvert.convert<String>(json['DescList']);
	if (descList != null) {
		presentData.descList = descList;
	}
	final String? hashId = jsonConvert.convert<String>(json['HashId']);
	if (hashId != null) {
		presentData.hashId = hashId;
	}
	final int? convertType = jsonConvert.convert<int>(json['ConvertType']);
	if (convertType != null) {
		presentData.convertType = convertType;
	}
	return presentData;
}

Map<String, dynamic> $PresentDataToJson(PresentData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['ProductName'] = entity.productName;
	data['ProductPhoto'] = entity.productPhoto;
	data['AuthorName'] = entity.authorName;
	data['ProductPrice'] = entity.productPrice;
	data['ProductUnit'] = entity.productUnit;
	data['DescList'] = entity.descList;
	data['HashId'] = entity.hashId;
	data['ConvertType'] = entity.convertType;
	return data;
}