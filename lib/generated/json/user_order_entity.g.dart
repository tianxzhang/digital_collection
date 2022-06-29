import 'package:digital_collection/generated/json/base/json_convert_content.dart';
import 'package:digital_collection/my/model/user_order_entity.dart';

UserOrderEntity $UserOrderEntityFromJson(Map<String, dynamic> json) {
	final UserOrderEntity userOrderEntity = UserOrderEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		userOrderEntity.code = code;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		userOrderEntity.message = message;
	}
	final UserOrderData? data = jsonConvert.convert<UserOrderData>(json['data']);
	if (data != null) {
		userOrderEntity.data = data;
	}
	return userOrderEntity;
}

Map<String, dynamic> $UserOrderEntityToJson(UserOrderEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

UserOrderData $UserOrderDataFromJson(Map<String, dynamic> json) {
	final UserOrderData userOrderData = UserOrderData();
	final List<UserOrderDataList>? list = jsonConvert.convertListNotNull<UserOrderDataList>(json['list']);
	if (list != null) {
		userOrderData.list = list;
	}
	return userOrderData;
}

Map<String, dynamic> $UserOrderDataToJson(UserOrderData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['list'] =  entity.list?.map((v) => v.toJson()).toList();
	return data;
}

UserOrderDataList $UserOrderDataListFromJson(Map<String, dynamic> json) {
	final UserOrderDataList userOrderDataList = UserOrderDataList();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		userOrderDataList.id = id;
	}
	final int? productId = jsonConvert.convert<int>(json['ProductId']);
	if (productId != null) {
		userOrderDataList.productId = productId;
	}
	final int? orderId = jsonConvert.convert<int>(json['OrderId']);
	if (orderId != null) {
		userOrderDataList.orderId = orderId;
	}
	final int? status = jsonConvert.convert<int>(json['Status']);
	if (status != null) {
		userOrderDataList.status = status;
	}
	final String? statusName = jsonConvert.convert<String>(json['StatusName']);
	if (statusName != null) {
		userOrderDataList.statusName = statusName;
	}
	final String? productName = jsonConvert.convert<String>(json['ProductName']);
	if (productName != null) {
		userOrderDataList.productName = productName;
	}
	final String? productPhoto = jsonConvert.convert<String>(json['ProductPhoto']);
	if (productPhoto != null) {
		userOrderDataList.productPhoto = productPhoto;
	}
	final String? productPrice = jsonConvert.convert<String>(json['ProductPrice']);
	if (productPrice != null) {
		userOrderDataList.productPrice = productPrice;
	}
	final String? productPriceUnit = jsonConvert.convert<String>(json['ProductPriceUnit']);
	if (productPriceUnit != null) {
		userOrderDataList.productPriceUnit = productPriceUnit;
	}
	final String? authorName = jsonConvert.convert<String>(json['AuthorName']);
	if (authorName != null) {
		userOrderDataList.authorName = authorName;
	}
	return userOrderDataList;
}

Map<String, dynamic> $UserOrderDataListToJson(UserOrderDataList entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['ProductId'] = entity.productId;
	data['OrderId'] = entity.orderId;
	data['Status'] = entity.status;
	data['StatusName'] = entity.statusName;
	data['ProductName'] = entity.productName;
	data['ProductPhoto'] = entity.productPhoto;
	data['ProductPrice'] = entity.productPrice;
	data['ProductPriceUnit'] = entity.productPriceUnit;
	data['AuthorName'] = entity.authorName;
	return data;
}