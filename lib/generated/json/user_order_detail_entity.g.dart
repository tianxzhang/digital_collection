import 'package:digital_collection/generated/json/base/json_convert_content.dart';
import 'package:digital_collection/my/model/user_order_detail_entity.dart';

UserOrderDetailEntity $UserOrderDetailEntityFromJson(Map<String, dynamic> json) {
	final UserOrderDetailEntity userOrderDetailEntity = UserOrderDetailEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		userOrderDetailEntity.code = code;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		userOrderDetailEntity.message = message;
	}
	final UserOrderDetailData? data = jsonConvert.convert<UserOrderDetailData>(json['data']);
	if (data != null) {
		userOrderDetailEntity.data = data;
	}
	return userOrderDetailEntity;
}

Map<String, dynamic> $UserOrderDetailEntityToJson(UserOrderDetailEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

UserOrderDetailData $UserOrderDetailDataFromJson(Map<String, dynamic> json) {
	final UserOrderDetailData userOrderDetailData = UserOrderDetailData();
	final int? productId = jsonConvert.convert<int>(json['ProductId']);
	if (productId != null) {
		userOrderDetailData.productId = productId;
	}
	final int? orderId = jsonConvert.convert<int>(json['OrderId']);
	if (orderId != null) {
		userOrderDetailData.orderId = orderId;
	}
	final int? userId = jsonConvert.convert<int>(json['UserId']);
	if (userId != null) {
		userOrderDetailData.userId = userId;
	}
	final int? status = jsonConvert.convert<int>(json['Status']);
	if (status != null) {
		userOrderDetailData.status = status;
	}
	final String? statusName = jsonConvert.convert<String>(json['StatusName']);
	if (statusName != null) {
		userOrderDetailData.statusName = statusName;
	}
	final String? productName = jsonConvert.convert<String>(json['ProductName']);
	if (productName != null) {
		userOrderDetailData.productName = productName;
	}
	final String? productPhoto = jsonConvert.convert<String>(json['ProductPhoto']);
	if (productPhoto != null) {
		userOrderDetailData.productPhoto = productPhoto;
	}
	final String? productPrice = jsonConvert.convert<String>(json['ProductPrice']);
	if (productPrice != null) {
		userOrderDetailData.productPrice = productPrice;
	}
	final String? productUnit = jsonConvert.convert<String>(json['ProductUnit']);
	if (productUnit != null) {
		userOrderDetailData.productUnit = productUnit;
	}
	final String? authorName = jsonConvert.convert<String>(json['AuthorName']);
	if (authorName != null) {
		userOrderDetailData.authorName = authorName;
	}
	final int? payType = jsonConvert.convert<int>(json['PayType']);
	if (payType != null) {
		userOrderDetailData.payType = payType;
	}
	final int? payTime = jsonConvert.convert<int>(json['PayTime']);
	if (payTime != null) {
		userOrderDetailData.payTime = payTime;
	}
	final int? createAt = jsonConvert.convert<int>(json['Create_At']);
	if (createAt != null) {
		userOrderDetailData.createAt = createAt;
	}
	final int? count = jsonConvert.convert<int>(json['Count']);
	if (count != null) {
		userOrderDetailData.count = count;
	}
	return userOrderDetailData;
}

Map<String, dynamic> $UserOrderDetailDataToJson(UserOrderDetailData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['ProductId'] = entity.productId;
	data['OrderId'] = entity.orderId;
	data['UserId'] = entity.userId;
	data['Status'] = entity.status;
	data['StatusName'] = entity.statusName;
	data['ProductName'] = entity.productName;
	data['ProductPhoto'] = entity.productPhoto;
	data['ProductPrice'] = entity.productPrice;
	data['ProductUnit'] = entity.productUnit;
	data['AuthorName'] = entity.authorName;
	data['PayType'] = entity.payType;
	data['PayTime'] = entity.payTime;
	data['Create_At'] = entity.createAt;
	data['Count'] = entity.count;
	return data;
}