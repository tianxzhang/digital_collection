import 'package:digital_collection/generated/json/base/json_convert_content.dart';
import 'package:digital_collection/home/model/production_list_entity.dart';

ProductionListEntity $ProductionListEntityFromJson(Map<String, dynamic> json) {
	final ProductionListEntity productionListEntity = ProductionListEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		productionListEntity.code = code;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		productionListEntity.message = message;
	}
	final ProductionListData? data = jsonConvert.convert<ProductionListData>(json['data']);
	if (data != null) {
		productionListEntity.data = data;
	}
	return productionListEntity;
}

Map<String, dynamic> $ProductionListEntityToJson(ProductionListEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

ProductionListData $ProductionListDataFromJson(Map<String, dynamic> json) {
	final ProductionListData productionListData = ProductionListData();
	final List<ProductionListDataProducts>? products = jsonConvert.convertListNotNull<ProductionListDataProducts>(json['products']);
	if (products != null) {
		productionListData.products = products;
	}
	final int? serverTime = jsonConvert.convert<int>(json['serverTime']);
	if (serverTime != null) {
		productionListData.serverTime = serverTime;
	}
	final dynamic? bannerList = jsonConvert.convert<dynamic>(json['bannerList']);
	if (bannerList != null) {
		productionListData.bannerList = bannerList;
	}
	return productionListData;
}

Map<String, dynamic> $ProductionListDataToJson(ProductionListData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['products'] =  entity.products?.map((v) => v.toJson()).toList();
	data['serverTime'] = entity.serverTime;
	data['bannerList'] = entity.bannerList;
	return data;
}

ProductionListDataProducts $ProductionListDataProductsFromJson(Map<String, dynamic> json) {
	final ProductionListDataProducts productionListDataProducts = ProductionListDataProducts();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		productionListDataProducts.id = id;
	}
	final String? productName = jsonConvert.convert<String>(json['product_name']);
	if (productName != null) {
		productionListDataProducts.productName = productName;
	}
	final String? placeholder = jsonConvert.convert<String>(json['placeholder']);
	if (placeholder != null) {
		productionListDataProducts.placeholder = placeholder;
	}
	final int? oneCategoryId = jsonConvert.convert<int>(json['one_category_id']);
	if (oneCategoryId != null) {
		productionListDataProducts.oneCategoryId = oneCategoryId;
	}
	final int? supplierId = jsonConvert.convert<int>(json['supplier_id']);
	if (supplierId != null) {
		productionListDataProducts.supplierId = supplierId;
	}
	final String? supplierName = jsonConvert.convert<String>(json['supplier_name']);
	if (supplierName != null) {
		productionListDataProducts.supplierName = supplierName;
	}
	final String? supplierPhoto = jsonConvert.convert<String>(json['supplier_photo']);
	if (supplierPhoto != null) {
		productionListDataProducts.supplierPhoto = supplierPhoto;
	}
	final String? priceString = jsonConvert.convert<String>(json['price_string']);
	if (priceString != null) {
		productionListDataProducts.priceString = priceString;
	}
	final String? priceUnit = jsonConvert.convert<String>(json['price_unit']);
	if (priceUnit != null) {
		productionListDataProducts.priceUnit = priceUnit;
	}
	final int? sellCount = jsonConvert.convert<int>(json['sell_count']);
	if (sellCount != null) {
		productionListDataProducts.sellCount = sellCount;
	}
	final int? sellTime = jsonConvert.convert<int>(json['sell_time']);
	if (sellTime != null) {
		productionListDataProducts.sellTime = sellTime;
	}
	final int? status = jsonConvert.convert<int>(json['status']);
	if (status != null) {
		productionListDataProducts.status = status;
	}
	return productionListDataProducts;
}

Map<String, dynamic> $ProductionListDataProductsToJson(ProductionListDataProducts entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['product_name'] = entity.productName;
	data['placeholder'] = entity.placeholder;
	data['one_category_id'] = entity.oneCategoryId;
	data['supplier_id'] = entity.supplierId;
	data['supplier_name'] = entity.supplierName;
	data['supplier_photo'] = entity.supplierPhoto;
	data['price_string'] = entity.priceString;
	data['price_unit'] = entity.priceUnit;
	data['sell_count'] = entity.sellCount;
	data['sell_time'] = entity.sellTime;
	data['status'] = entity.status;
	return data;
}