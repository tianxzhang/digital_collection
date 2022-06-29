import 'package:digital_collection/generated/json/base/json_convert_content.dart';
import 'package:digital_collection/my/model/present_detail_entity.dart';

PresentDetailEntity $PresentDetailEntityFromJson(Map<String, dynamic> json) {
	final PresentDetailEntity presentDetailEntity = PresentDetailEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		presentDetailEntity.code = code;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		presentDetailEntity.message = message;
	}
	final PresentDetailData? data = jsonConvert.convert<PresentDetailData>(json['data']);
	if (data != null) {
		presentDetailEntity.data = data;
	}
	return presentDetailEntity;
}

Map<String, dynamic> $PresentDetailEntityToJson(PresentDetailEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

PresentDetailData $PresentDetailDataFromJson(Map<String, dynamic> json) {
	final PresentDetailData presentDetailData = PresentDetailData();
	final int? orderId = jsonConvert.convert<int>(json['OrderId']);
	if (orderId != null) {
		presentDetailData.orderId = orderId;
	}
	final int? status = jsonConvert.convert<int>(json['Status']);
	if (status != null) {
		presentDetailData.status = status;
	}
	final String? statusName = jsonConvert.convert<String>(json['StatusName']);
	if (statusName != null) {
		presentDetailData.statusName = statusName;
	}
	final String? toPhone = jsonConvert.convert<String>(json['to_phone']);
	if (toPhone != null) {
		presentDetailData.toPhone = toPhone;
	}
	final String? productName = jsonConvert.convert<String>(json['ProductName']);
	if (productName != null) {
		presentDetailData.productName = productName;
	}
	final String? productPhoto = jsonConvert.convert<String>(json['ProductPhoto']);
	if (productPhoto != null) {
		presentDetailData.productPhoto = productPhoto;
	}
	final String? storeNum = jsonConvert.convert<String>(json['store_num']);
	if (storeNum != null) {
		presentDetailData.storeNum = storeNum;
	}
	final String? productPrice = jsonConvert.convert<String>(json['ProductPrice']);
	if (productPrice != null) {
		presentDetailData.productPrice = productPrice;
	}
	final String? productUnit = jsonConvert.convert<String>(json['ProductUnit']);
	if (productUnit != null) {
		presentDetailData.productUnit = productUnit;
	}
	return presentDetailData;
}

Map<String, dynamic> $PresentDetailDataToJson(PresentDetailData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['OrderId'] = entity.orderId;
	data['Status'] = entity.status;
	data['StatusName'] = entity.statusName;
	data['to_phone'] = entity.toPhone;
	data['ProductName'] = entity.productName;
	data['ProductPhoto'] = entity.productPhoto;
	data['store_num'] = entity.storeNum;
	data['ProductPrice'] = entity.productPrice;
	data['ProductUnit'] = entity.productUnit;
	return data;
}