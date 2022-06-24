import 'package:digital_collection/generated/json/base/json_convert_content.dart';
import 'package:digital_collection/my/model/collection_entity.dart';

CollectionEntity $CollectionEntityFromJson(Map<String, dynamic> json) {
	final CollectionEntity collectionEntity = CollectionEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		collectionEntity.code = code;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		collectionEntity.message = message;
	}
	final CollectionData? data = jsonConvert.convert<CollectionData>(json['data']);
	if (data != null) {
		collectionEntity.data = data;
	}
	return collectionEntity;
}

Map<String, dynamic> $CollectionEntityToJson(CollectionEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}

CollectionData $CollectionDataFromJson(Map<String, dynamic> json) {
	final CollectionData collectionData = CollectionData();
	final List<CollectionDataList>? list = jsonConvert.convertListNotNull<CollectionDataList>(json['list']);
	if (list != null) {
		collectionData.list = list;
	}
	return collectionData;
}

Map<String, dynamic> $CollectionDataToJson(CollectionData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['list'] =  entity.list?.map((v) => v.toJson()).toList();
	return data;
}

CollectionDataList $CollectionDataListFromJson(Map<String, dynamic> json) {
	final CollectionDataList collectionDataList = CollectionDataList();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		collectionDataList.id = id;
	}
	final int? cowryId = jsonConvert.convert<int>(json['cowry_id']);
	if (cowryId != null) {
		collectionDataList.cowryId = cowryId;
	}
	final String? productName = jsonConvert.convert<String>(json['product_name']);
	if (productName != null) {
		collectionDataList.productName = productName;
	}
	final String? productCover = jsonConvert.convert<String>(json['product_cover']);
	if (productCover != null) {
		collectionDataList.productCover = productCover;
	}
	final String? supplierName = jsonConvert.convert<String>(json['supplier_name']);
	if (supplierName != null) {
		collectionDataList.supplierName = supplierName;
	}
	final String? metaName = jsonConvert.convert<String>(json['meta_name']);
	if (metaName != null) {
		collectionDataList.metaName = metaName;
	}
	return collectionDataList;
}

Map<String, dynamic> $CollectionDataListToJson(CollectionDataList entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['cowry_id'] = entity.cowryId;
	data['product_name'] = entity.productName;
	data['product_cover'] = entity.productCover;
	data['supplier_name'] = entity.supplierName;
	data['meta_name'] = entity.metaName;
	return data;
}