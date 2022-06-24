import 'package:digital_collection/generated/json/base/json_convert_content.dart';
import 'package:digital_collection/my/model/collection_detail_entity.dart';

CollectionDetailEntity $CollectionDetailEntityFromJson(Map<String, dynamic> json) {
	final CollectionDetailEntity collectionDetailEntity = CollectionDetailEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		collectionDetailEntity.code = code;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		collectionDetailEntity.message = message;
	}
	final CollectionDetailData? data = jsonConvert.convert<CollectionDetailData>(json['data']);
	if (data != null) {
		collectionDetailEntity.data = data;
	}
	return collectionDetailEntity;
}

Map<String, dynamic> $CollectionDetailEntityToJson(CollectionDetailEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

CollectionDetailData $CollectionDetailDataFromJson(Map<String, dynamic> json) {
	final CollectionDetailData collectionDetailData = CollectionDetailData();
	final String? productName = jsonConvert.convert<String>(json['product_name']);
	if (productName != null) {
		collectionDetailData.productName = productName;
	}
	final String? productImage = jsonConvert.convert<String>(json['product_image']);
	if (productImage != null) {
		collectionDetailData.productImage = productImage;
	}
	final String? supplierName = jsonConvert.convert<String>(json['supplier_name']);
	if (supplierName != null) {
		collectionDetailData.supplierName = supplierName;
	}
	final String? hashId = jsonConvert.convert<String>(json['hash_id']);
	if (hashId != null) {
		collectionDetailData.hashId = hashId;
	}
	final String? contractId = jsonConvert.convert<String>(json['contract_id']);
	if (contractId != null) {
		collectionDetailData.contractId = contractId;
	}
	final String? metaName = jsonConvert.convert<String>(json['meta_name']);
	if (metaName != null) {
		collectionDetailData.metaName = metaName;
	}
	final String? blockName = jsonConvert.convert<String>(json['block_name']);
	if (blockName != null) {
		collectionDetailData.blockName = blockName;
	}
	final int? createTime = jsonConvert.convert<int>(json['create_time']);
	if (createTime != null) {
		collectionDetailData.createTime = createTime;
	}
	final String? collectorName = jsonConvert.convert<String>(json['collector_name']);
	if (collectorName != null) {
		collectionDetailData.collectorName = collectorName;
	}
	final bool? storeIsConvert = jsonConvert.convert<bool>(json['store_is_convert']);
	if (storeIsConvert != null) {
		collectionDetailData.storeIsConvert = storeIsConvert;
	}
	final int? storeConvertType = jsonConvert.convert<int>(json['store_convert_type']);
	if (storeConvertType != null) {
		collectionDetailData.storeConvertType = storeConvertType;
	}
	final bool? productIs3d = jsonConvert.convert<bool>(json['product_is_3d']);
	if (productIs3d != null) {
		collectionDetailData.productIs3d = productIs3d;
	}
	return collectionDetailData;
}

Map<String, dynamic> $CollectionDetailDataToJson(CollectionDetailData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['product_name'] = entity.productName;
	data['product_image'] = entity.productImage;
	data['supplier_name'] = entity.supplierName;
	data['hash_id'] = entity.hashId;
	data['contract_id'] = entity.contractId;
	data['meta_name'] = entity.metaName;
	data['block_name'] = entity.blockName;
	data['create_time'] = entity.createTime;
	data['collector_name'] = entity.collectorName;
	data['store_is_convert'] = entity.storeIsConvert;
	data['store_convert_type'] = entity.storeConvertType;
	data['product_is_3d'] = entity.productIs3d;
	return data;
}