import 'package:digital_collection/generated/json/base/json_convert_content.dart';
import 'package:digital_collection/home/model/product_detail_entity.dart';

ProductDetailEntity $ProductDetailEntityFromJson(Map<String, dynamic> json) {
	final ProductDetailEntity productDetailEntity = ProductDetailEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		productDetailEntity.code = code;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		productDetailEntity.message = message;
	}
	final ProductDetailData? data = jsonConvert.convert<ProductDetailData>(json['data']);
	if (data != null) {
		productDetailEntity.data = data;
	}
	return productDetailEntity;
}

Map<String, dynamic> $ProductDetailEntityToJson(ProductDetailEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

ProductDetailData $ProductDetailDataFromJson(Map<String, dynamic> json) {
	final ProductDetailData productDetailData = ProductDetailData();
	final ProductDetailDataInfo? info = jsonConvert.convert<ProductDetailDataInfo>(json['info']);
	if (info != null) {
		productDetailData.info = info;
	}
	final int? status = jsonConvert.convert<int>(json['status']);
	if (status != null) {
		productDetailData.status = status;
	}
	final int? serverTime = jsonConvert.convert<int>(json['serverTime']);
	if (serverTime != null) {
		productDetailData.serverTime = serverTime;
	}
	return productDetailData;
}

Map<String, dynamic> $ProductDetailDataToJson(ProductDetailData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['info'] = entity.info?.toJson();
	data['status'] = entity.status;
	data['serverTime'] = entity.serverTime;
	return data;
}

ProductDetailDataInfo $ProductDetailDataInfoFromJson(Map<String, dynamic> json) {
	final ProductDetailDataInfo productDetailDataInfo = ProductDetailDataInfo();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		productDetailDataInfo.id = id;
	}
	final String? productName = jsonConvert.convert<String>(json['product_name']);
	if (productName != null) {
		productDetailDataInfo.productName = productName;
	}
	final String? placeholder = jsonConvert.convert<String>(json['placeholder']);
	if (placeholder != null) {
		productDetailDataInfo.placeholder = placeholder;
	}
	final int? supplierId = jsonConvert.convert<int>(json['supplier_id']);
	if (supplierId != null) {
		productDetailDataInfo.supplierId = supplierId;
	}
	final String? supplierPhoto = jsonConvert.convert<String>(json['supplier_photo']);
	if (supplierPhoto != null) {
		productDetailDataInfo.supplierPhoto = supplierPhoto;
	}
	final String? supplierName = jsonConvert.convert<String>(json['supplier_name']);
	if (supplierName != null) {
		productDetailDataInfo.supplierName = supplierName;
	}
	final String? supplierDesc = jsonConvert.convert<String>(json['supplier_desc']);
	if (supplierDesc != null) {
		productDetailDataInfo.supplierDesc = supplierDesc;
	}
	final String? priceString = jsonConvert.convert<String>(json['price_string']);
	if (priceString != null) {
		productDetailDataInfo.priceString = priceString;
	}
	final String? priceUnit = jsonConvert.convert<String>(json['price_unit']);
	if (priceUnit != null) {
		productDetailDataInfo.priceUnit = priceUnit;
	}
	final int? sellCount = jsonConvert.convert<int>(json['sell_count']);
	if (sellCount != null) {
		productDetailDataInfo.sellCount = sellCount;
	}
	final int? sellTime = jsonConvert.convert<int>(json['sell_time']);
	if (sellTime != null) {
		productDetailDataInfo.sellTime = sellTime;
	}
	final List<String>? productDescImage = jsonConvert.convertListNotNull<String>(json['product_desc_image']);
	if (productDescImage != null) {
		productDetailDataInfo.productDescImage = productDescImage;
	}
	final List<String>? productImage = jsonConvert.convertListNotNull<String>(json['product_image']);
	if (productImage != null) {
		productDetailDataInfo.productImage = productImage;
	}
	final String? buyNotes = jsonConvert.convert<String>(json['buy_notes']);
	if (buyNotes != null) {
		productDetailDataInfo.buyNotes = buyNotes;
	}
	final int? oneCategoryId = jsonConvert.convert<int>(json['one_category_id']);
	if (oneCategoryId != null) {
		productDetailDataInfo.oneCategoryId = oneCategoryId;
	}
	final bool? productIs3d = jsonConvert.convert<bool>(json['product_is_3d']);
	if (productIs3d != null) {
		productDetailDataInfo.productIs3d = productIs3d;
	}
	return productDetailDataInfo;
}

Map<String, dynamic> $ProductDetailDataInfoToJson(ProductDetailDataInfo entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['product_name'] = entity.productName;
	data['placeholder'] = entity.placeholder;
	data['supplier_id'] = entity.supplierId;
	data['supplier_photo'] = entity.supplierPhoto;
	data['supplier_name'] = entity.supplierName;
	data['supplier_desc'] = entity.supplierDesc;
	data['price_string'] = entity.priceString;
	data['price_unit'] = entity.priceUnit;
	data['sell_count'] = entity.sellCount;
	data['sell_time'] = entity.sellTime;
	data['product_desc_image'] =  entity.productDescImage;
	data['product_image'] =  entity.productImage;
	data['buy_notes'] = entity.buyNotes;
	data['one_category_id'] = entity.oneCategoryId;
	data['product_is_3d'] = entity.productIs3d;
	return data;
}