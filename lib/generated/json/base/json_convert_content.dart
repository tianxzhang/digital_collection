// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter/material.dart';
import 'package:digital_collection/home/model/product_detail_entity.dart';
import 'package:digital_collection/home/model/production_list_entity.dart';
import 'package:digital_collection/my/model/collection_detail_entity.dart';
import 'package:digital_collection/my/model/collection_entity.dart';
import 'package:digital_collection/my/model/user_info_entity.dart';
import 'package:digital_collection/my/model/user_order_detail_entity.dart';
import 'package:digital_collection/my/model/user_order_entity.dart';

JsonConvert jsonConvert = JsonConvert();
typedef JsonConvertFunction<T> = T Function(Map<String, dynamic> json);

class JsonConvert {
	static final Map<String, JsonConvertFunction> _convertFuncMap = {
		(ProductDetailEntity).toString(): ProductDetailEntity.fromJson,
		(ProductDetailData).toString(): ProductDetailData.fromJson,
		(ProductDetailDataInfo).toString(): ProductDetailDataInfo.fromJson,
		(ProductionListEntity).toString(): ProductionListEntity.fromJson,
		(ProductionListData).toString(): ProductionListData.fromJson,
		(ProductionListDataProducts).toString(): ProductionListDataProducts.fromJson,
		(CollectionDetailEntity).toString(): CollectionDetailEntity.fromJson,
		(CollectionDetailData).toString(): CollectionDetailData.fromJson,
		(CollectionEntity).toString(): CollectionEntity.fromJson,
		(CollectionData).toString(): CollectionData.fromJson,
		(CollectionDataList).toString(): CollectionDataList.fromJson,
		(UserInfoEntity).toString(): UserInfoEntity.fromJson,
		(UserInfoData).toString(): UserInfoData.fromJson,
		(UserOrderDetailEntity).toString(): UserOrderDetailEntity.fromJson,
		(UserOrderDetailData).toString(): UserOrderDetailData.fromJson,
		(UserOrderEntity).toString(): UserOrderEntity.fromJson,
		(UserOrderData).toString(): UserOrderData.fromJson,
		(UserOrderDataList).toString(): UserOrderDataList.fromJson,
	};

  T? convert<T>(dynamic value) {
    if (value == null) {
      return null;
    }
    return asT<T>(value);
  }

  List<T?>? convertList<T>(List<dynamic>? value) {
    if (value == null) {
      return null;
    }
    try {
      return value.map((dynamic e) => asT<T>(e)).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  List<T>? convertListNotNull<T>(dynamic value) {
    if (value == null) {
      return null;
    }
    try {
      return (value as List<dynamic>).map((dynamic e) => asT<T>(e)!).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  T? asT<T extends Object?>(dynamic value) {
    if (value is T) {
      return value;
    }
    final String type = T.toString();
    try {
      final String valueS = value.toString();
      if (type == "String") {
        return valueS as T;
      } else if (type == "int") {
        final int? intValue = int.tryParse(valueS);
        if (intValue == null) {
          return double.tryParse(valueS)?.toInt() as T?;
        } else {
          return intValue as T;
        }
      } else if (type == "double") {
        return double.parse(valueS) as T;
      } else if (type == "DateTime") {
        return DateTime.parse(valueS) as T;
      } else if (type == "bool") {
        if (valueS == '0' || valueS == '1') {
          return (valueS == '1') as T;
        }
        return (valueS == 'true') as T;
      } else if (type == "Map" || type.startsWith("Map<")) {
        return value as T;
      } else {
        if (_convertFuncMap.containsKey(type)) {
          return _convertFuncMap[type]!(value) as T;
        } else {
          throw UnimplementedError('$type unimplemented');
        }
      }
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return null;
    }
  }

	//list is returned by type
	static M? _getListChildType<M>(List<Map<String, dynamic>> data) {
		if(<ProductDetailEntity>[] is M){
			return data.map<ProductDetailEntity>((Map<String, dynamic> e) => ProductDetailEntity.fromJson(e)).toList() as M;
		}
		if(<ProductDetailData>[] is M){
			return data.map<ProductDetailData>((Map<String, dynamic> e) => ProductDetailData.fromJson(e)).toList() as M;
		}
		if(<ProductDetailDataInfo>[] is M){
			return data.map<ProductDetailDataInfo>((Map<String, dynamic> e) => ProductDetailDataInfo.fromJson(e)).toList() as M;
		}
		if(<ProductionListEntity>[] is M){
			return data.map<ProductionListEntity>((Map<String, dynamic> e) => ProductionListEntity.fromJson(e)).toList() as M;
		}
		if(<ProductionListData>[] is M){
			return data.map<ProductionListData>((Map<String, dynamic> e) => ProductionListData.fromJson(e)).toList() as M;
		}
		if(<ProductionListDataProducts>[] is M){
			return data.map<ProductionListDataProducts>((Map<String, dynamic> e) => ProductionListDataProducts.fromJson(e)).toList() as M;
		}
		if(<CollectionDetailEntity>[] is M){
			return data.map<CollectionDetailEntity>((Map<String, dynamic> e) => CollectionDetailEntity.fromJson(e)).toList() as M;
		}
		if(<CollectionDetailData>[] is M){
			return data.map<CollectionDetailData>((Map<String, dynamic> e) => CollectionDetailData.fromJson(e)).toList() as M;
		}
		if(<CollectionEntity>[] is M){
			return data.map<CollectionEntity>((Map<String, dynamic> e) => CollectionEntity.fromJson(e)).toList() as M;
		}
		if(<CollectionData>[] is M){
			return data.map<CollectionData>((Map<String, dynamic> e) => CollectionData.fromJson(e)).toList() as M;
		}
		if(<CollectionDataList>[] is M){
			return data.map<CollectionDataList>((Map<String, dynamic> e) => CollectionDataList.fromJson(e)).toList() as M;
		}
		if(<UserInfoEntity>[] is M){
			return data.map<UserInfoEntity>((Map<String, dynamic> e) => UserInfoEntity.fromJson(e)).toList() as M;
		}
		if(<UserInfoData>[] is M){
			return data.map<UserInfoData>((Map<String, dynamic> e) => UserInfoData.fromJson(e)).toList() as M;
		}
		if(<UserOrderDetailEntity>[] is M){
			return data.map<UserOrderDetailEntity>((Map<String, dynamic> e) => UserOrderDetailEntity.fromJson(e)).toList() as M;
		}
		if(<UserOrderDetailData>[] is M){
			return data.map<UserOrderDetailData>((Map<String, dynamic> e) => UserOrderDetailData.fromJson(e)).toList() as M;
		}
		if(<UserOrderEntity>[] is M){
			return data.map<UserOrderEntity>((Map<String, dynamic> e) => UserOrderEntity.fromJson(e)).toList() as M;
		}
		if(<UserOrderData>[] is M){
			return data.map<UserOrderData>((Map<String, dynamic> e) => UserOrderData.fromJson(e)).toList() as M;
		}
		if(<UserOrderDataList>[] is M){
			return data.map<UserOrderDataList>((Map<String, dynamic> e) => UserOrderDataList.fromJson(e)).toList() as M;
		}

		debugPrint("${M.toString()} not found");
	
		return null;
}

	static M? fromJsonAsT<M>(dynamic json) {
		if (json is List) {
			return _getListChildType<M>(json.map((e) => e as Map<String, dynamic>).toList());
		} else {
			return jsonConvert.asT<M>(json);
		}
	}
}