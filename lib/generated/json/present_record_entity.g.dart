import 'package:digital_collection/generated/json/base/json_convert_content.dart';
import 'package:digital_collection/my/model/present_record_entity.dart';

PresentRecordEntity $PresentRecordEntityFromJson(Map<String, dynamic> json) {
	final PresentRecordEntity presentRecordEntity = PresentRecordEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		presentRecordEntity.code = code;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		presentRecordEntity.message = message;
	}
	final PresentRecordData? data = jsonConvert.convert<PresentRecordData>(json['data']);
	if (data != null) {
		presentRecordEntity.data = data;
	}
	return presentRecordEntity;
}

Map<String, dynamic> $PresentRecordEntityToJson(PresentRecordEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

PresentRecordData $PresentRecordDataFromJson(Map<String, dynamic> json) {
	final PresentRecordData presentRecordData = PresentRecordData();
	final List<PresentRecordDataList>? list = jsonConvert.convertListNotNull<PresentRecordDataList>(json['list']);
	if (list != null) {
		presentRecordData.list = list;
	}
	return presentRecordData;
}

Map<String, dynamic> $PresentRecordDataToJson(PresentRecordData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['list'] =  entity.list?.map((v) => v.toJson()).toList();
	return data;
}

PresentRecordDataList $PresentRecordDataListFromJson(Map<String, dynamic> json) {
	final PresentRecordDataList presentRecordDataList = PresentRecordDataList();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		presentRecordDataList.id = id;
	}
	final int? orderId = jsonConvert.convert<int>(json['OrderId']);
	if (orderId != null) {
		presentRecordDataList.orderId = orderId;
	}
	final int? status = jsonConvert.convert<int>(json['Status']);
	if (status != null) {
		presentRecordDataList.status = status;
	}
	final String? statusName = jsonConvert.convert<String>(json['StatusName']);
	if (statusName != null) {
		presentRecordDataList.statusName = statusName;
	}
	final String? productName = jsonConvert.convert<String>(json['ProductName']);
	if (productName != null) {
		presentRecordDataList.productName = productName;
	}
	final String? productPhoto = jsonConvert.convert<String>(json['ProductPhoto']);
	if (productPhoto != null) {
		presentRecordDataList.productPhoto = productPhoto;
	}
	final String? authorName = jsonConvert.convert<String>(json['AuthorName']);
	if (authorName != null) {
		presentRecordDataList.authorName = authorName;
	}
	final String? toPhone = jsonConvert.convert<String>(json['ToPhone']);
	if (toPhone != null) {
		presentRecordDataList.toPhone = toPhone;
	}
	final String? cowryNum = jsonConvert.convert<String>(json['CowryNum']);
	if (cowryNum != null) {
		presentRecordDataList.cowryNum = cowryNum;
	}
	return presentRecordDataList;
}

Map<String, dynamic> $PresentRecordDataListToJson(PresentRecordDataList entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['OrderId'] = entity.orderId;
	data['Status'] = entity.status;
	data['StatusName'] = entity.statusName;
	data['ProductName'] = entity.productName;
	data['ProductPhoto'] = entity.productPhoto;
	data['AuthorName'] = entity.authorName;
	data['ToPhone'] = entity.toPhone;
	data['CowryNum'] = entity.cowryNum;
	return data;
}