import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:digital_collection/my/model/user_order_detail_entity.dart';
import 'package:digital_collection/util/color_util.dart';
import 'package:digital_collection/util/network_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserOrderDetailPage extends StatefulWidget {
  final String id;

  UserOrderDetailPage(this.id);

  @override
  UserOrderDetailPageState createState() => UserOrderDetailPageState();
}

class UserOrderDetailPageState extends State<UserOrderDetailPage>
    with AutomaticKeepAliveClientMixin {
  var resultData;
  UserOrderDetailEntity userOrderDetailEntity = UserOrderDetailEntity();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    resultData = getData();
  }

  Future getData() async {
    Map<String, String> postMap = Map<String, String>();
    postMap['order_id'] = widget.id;
    var result = await NetWorkUtil.getHttpQuery("/n/order/Info", postMap);
    Map<String, dynamic> resultMap = json.decode(result.toString());
    if (resultMap["code"] == 1) {
      userOrderDetailEntity = UserOrderDetailEntity.fromJson(resultMap);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtil.hexColor(0x1E201F),
      body: FutureBuilder(
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(
                child: CupertinoActivityIndicator(),
              );
            case ConnectionState.done:
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SafeArea(
                      child: Container(
                        margin: EdgeInsets.only(top: 15.w,left: 15.w,right: 15.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              child: Container(
                                width: 20.w,
                                child: Icon(Icons.arrow_back_ios,color: ColorsUtil.hexColor(0xB5B5B5),),
                              ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            Container(
                              child: Text("操作密码",
                                  style: TextStyle(
                                      color: ColorsUtil.hexColor(0xffffff),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Container(
                              width: 20.w,
                              child: Text(""),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.only(top: 15.h),
                      height: 35.h,
                      color: ColorsUtil.hexColor(0x343635),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 15.w,right: 9.w),
                            width: 15.w,
                            height: 15.w,
                            child: Image.asset("assets/28.png"),
                          ),
                          Container(

                            child: Text("抢购成功以付款为结果",
                                style: TextStyle(
                                    color: ColorsUtil.hexColor(0xB5B5B5),
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.normal)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: Container(
                    margin: EdgeInsets.only(top: 18.h,bottom: 15.h),
                    width: 100.w,
                    height: 100.w,
                    child: Image.asset("assets/29.png"),
                  ),),
                  SliverToBoxAdapter(child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          '订单生成中',
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: ColorsUtil.hexColor(0xffffff),
                              fontWeight: FontWeight.bold))
                    ],
                  ),),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 105.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/27.png",
                            ),
                            fit: BoxFit.fill),
                      ),
                      margin: EdgeInsets.all(15.w),
                      child: Row(
                        children: [
                          Container(
                            width: 100.w,
                            height: 105.h,
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              httpHeaders: const {
                                'referer': 'http://app.xuanmengge.com'
                              },
                              placeholder: (context, url) =>
                                  Container(
                                    child: Center(
                                      child:
                                      CupertinoActivityIndicator(),
                                    ),
                                  ),
                              imageBuilder:
                                  (context, imageProvider) =>
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(
                                          5.r),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                              errorWidget:
                                  (context, url, error) =>
                                  Icon(Icons.error),
                              imageUrl: userOrderDetailEntity.data?.productPhoto??"",
                            ),
                          ),
                          Expanded(child: Container(
                            padding: EdgeInsets.all(12.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Text(userOrderDetailEntity.data?.productName??"",
                                            style: TextStyle(
                                                color: ColorsUtil.hexColor(0xffffff),
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Text(userOrderDetailEntity.data?.authorName??"",
                                      style: TextStyle(
                                          color: ColorsUtil.hexColor(0x7D7D7D),
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  child: Text("${userOrderDetailEntity.data?.productPrice??""}${userOrderDetailEntity.data?.productUnit??""}",
                                      style: TextStyle(
                                          color: ColorsUtil.hexColor(0xffffff),
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                    )
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.only(left: 15.w,right: 15.w,top: 25.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                                '订单金额',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: ColorsUtil.hexColor(0xB5B5B5),
                                    fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            child: Text(
                                "${userOrderDetailEntity.data?.productPrice??""}${userOrderDetailEntity.data?.productUnit??""}",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: ColorsUtil.hexColor(0xB5B5B5),
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.only(left: 15.w,right: 15.w,top: 25.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                                '交易数量',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: ColorsUtil.hexColor(0xB5B5B5),
                                    fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            child: Text(
                                "${userOrderDetailEntity.data?.count}",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: ColorsUtil.hexColor(0xB5B5B5),
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.only(left: 15.w,right: 15.w,top: 25.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                                '创建时间',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: ColorsUtil.hexColor(0xB5B5B5),
                                    fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            child: Text(
                                "${userOrderDetailEntity.data?.createAt}",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: ColorsUtil.hexColor(0xB5B5B5),
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.only(left: 15.w,right: 15.w,top: 25.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                                '付款时间',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: ColorsUtil.hexColor(0xB5B5B5),
                                    fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            child: Text(
                                "${userOrderDetailEntity.data?.payTime}",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: ColorsUtil.hexColor(0xB5B5B5),
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.only(left: 15.w,right: 15.w,top: 25.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                                '订单编号',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: ColorsUtil.hexColor(0xB5B5B5),
                                    fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            child: Text(
                                "${userOrderDetailEntity.data?.orderId}",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: ColorsUtil.hexColor(0xB5B5B5),
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
          }
        },
        future: resultData,
      ),
    );
  }
}
