import 'dart:convert';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:digital_collection/my/user_order_detail.dart';
import 'package:digital_collection/util/color_util.dart';
import 'package:digital_collection/util/network_util.dart';
import 'package:digital_collection/util/route_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'model/user_order_entity.dart';

class UserOrderPage extends StatefulWidget {
  @override
  UserOrderPageState createState() => UserOrderPageState();
}

class UserOrderPageState extends State<UserOrderPage>
    with AutomaticKeepAliveClientMixin {
  var resultData;
  UserOrderEntity userOrderEntity = UserOrderEntity();
  final RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    resultData = getData();
  }

  Future getData() async {
    Map<String, String> postMap = Map<String, String>();
    postMap['last_id'] = '-1';
    var result = await NetWorkUtil.getHttpQuery("/n/order/List", postMap);
    Map<String, dynamic> resultMap = json.decode(result.toString());
    if (resultMap["code"] == 1) {
      userOrderEntity = UserOrderEntity.fromJson(resultMap);
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
              return SmartRefresher(
                enablePullUp: true,
                enablePullDown: false,
                header: WaterDropMaterialHeader(),
                controller: _refreshController,
                onLoading: _onLoading,
                child: CustomScrollView(
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
                    SliverFixedExtentList(
                        delegate: SliverChildBuilderDelegate(
                                (context, index) {
                              return InkWell(
                                child: Container(
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
                                          imageUrl: userOrderEntity.data?.list?.elementAt(index).productPhoto??"",
                                        ),
                                      ),
                                      Expanded(child: Container(
                                        padding: EdgeInsets.all(12.w),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Container(
                                                    child: Text(userOrderEntity.data?.list?.elementAt(index).productName??"",
                                                        style: TextStyle(
                                                            color: ColorsUtil.hexColor(0xffffff),
                                                            fontSize: 14.sp,
                                                            fontWeight: FontWeight.bold)),
                                                  ),
                                                  Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Container(
                                                        width: 15.w,
                                                        height: 15.w,
                                                        child: Image.asset("assets/26.png"),
                                                      ),
                                                      Container(
                                                        child: Text(userOrderEntity.data?.list?.elementAt(index).statusName??"",
                                                            style: TextStyle(
                                                                color: ColorsUtil.hexColor(0xB5B5B5),
                                                                fontSize: 12.sp,
                                                                fontWeight: FontWeight.bold)),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 2.h),
                                              child: Text(userOrderEntity.data?.list?.elementAt(index).authorName??"",
                                                  style: TextStyle(
                                                      color: ColorsUtil.hexColor(0x7D7D7D),
                                                      fontSize: 12.sp,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 2.h),
                                              child: Text("${userOrderEntity.data?.list?.elementAt(index).productPrice??""}${userOrderEntity.data?.list?.elementAt(index).productPriceUnit??""}",
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
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      RouteUtil.createRoute(UserOrderDetailPage("${userOrderEntity.data?.list?.elementAt(index).orderId}")));
                                },
                              );
                            },
                            childCount: userOrderEntity.data?.list?.length??0),
                        itemExtent: 105.h)
                  ],
                ),
              );
          }
        },
        future: resultData,
      ),
    );
  }

  void _onLoading() async {
    _refreshController.loadNoData();
  }
}
