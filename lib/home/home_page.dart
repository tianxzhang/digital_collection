// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:digital_collection/home/model/production_list_entity.dart';
import 'package:digital_collection/home/product_detail_page.dart';
import 'package:digital_collection/login_register/login_page.dart';
import 'package:digital_collection/util/color_util.dart';
import 'package:digital_collection/util/network_util.dart';
import 'package:digital_collection/util/route_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  bool isLogin = false;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  var resultData;
  int curPage = 1;
  ProductionListEntity productionListEntity = ProductionListEntity();

  @override
  void initState() {
    super.initState();
    resultData = getData();
  }

  Future getData() async {
    Map<String, String> postMap = new Map<String, String>();
    postMap['page'] = curPage.toString();
    var result = await NetWorkUtil.getHttpQuery("/u/products", postMap);
    Map<String, dynamic> resultMap = json.decode(result.toString());
    productionListEntity = ProductionListEntity.fromJson(resultMap);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("token") != null && prefs.getString("token") != "") {
      isLogin = true;
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(
              child: CupertinoActivityIndicator(),
            );
          case ConnectionState.done:
            return SafeArea(
              child: Stack(
                children: [
                  SmartRefresher(
                    enablePullUp: true,
                    enablePullDown: false,
                    header: WaterDropMaterialHeader(),
                    controller: _refreshController,
                    onLoading: _onLoading,
                    child: CustomScrollView(
                      slivers: [
                        SliverFixedExtentList(
                            delegate: SliverChildBuilderDelegate(
                                    (context, index) {
                                  return Stack(
                                    children: [
                                      InkWell(
                                        child: Container(
                                          margin: EdgeInsets.only(top: 15.h,left: 15.w, right: 15.w),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.w),
                                            color: ColorsUtil.hexColor(0x000000,
                                                alpha: 0.5),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  "assets/product_bg.png",
                                                ),
                                                fit: BoxFit.fill),
                                          ),
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 340.h,
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
                                                  imageUrl: productionListEntity
                                                      .data!.products!
                                                      .elementAt(index)
                                                      .placeholder
                                                      .toString(),
                                                ),
                                              ),
                                              Expanded(child: Container(
                                                padding: EdgeInsets.only(left: 15.w,right: 15.w,bottom: 15.h),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          margin: EdgeInsets.only(top: 15.h),
                                                          child: Text(
                                                            productionListEntity
                                                                .data!.products!
                                                                .elementAt(index)
                                                                .productName ??
                                                                "",style: TextStyle(fontSize: 18.sp,color: ColorsUtil.hexColor(0xffffff),fontWeight: FontWeight.bold),),
                                                        ),
                                                        Container(
                                                            margin: EdgeInsets.only(top: 15.h),
                                                            child: Row(
                                                              mainAxisSize: MainAxisSize.min,
                                                              children: [
                                                                Container(
                                                                  width: 32.w,
                                                                  height: 16.h,
                                                                  child: Image.asset('assets/limited.png',fit: BoxFit.cover,),
                                                                ),
                                                                Container(
                                                                  width: 49.w,
                                                                  height: 16.h,
                                                                  color: ColorsUtil.hexColor(0x4B4B4B),
                                                                  alignment: Alignment.center,
                                                                  child: Text(
                                                                      "${productionListEntity.data!.products!.elementAt(index).sellCount}份",style: TextStyle(fontSize: 12.sp,color: ColorsUtil.hexColor(0xE5BB64),fontWeight: FontWeight.bold)),
                                                                )
                                                              ],
                                                            )
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(top: 15.h),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                            children: [
                                                              Container(
                                                                width: 18.w,
                                                                height: 18.w,
                                                                child: CachedNetworkImage(
                                                                  fit: BoxFit.fill,
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
                                                                          shape: BoxShape.circle,
                                                                          // borderRadius:
                                                                          // BorderRadius.circular(
                                                                          //     5.r),
                                                                          image: DecorationImage(
                                                                            image: imageProvider,
                                                                            fit: BoxFit.fill,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  errorWidget:
                                                                      (context, url, error) =>
                                                                      Icon(Icons.error),
                                                                  imageUrl: productionListEntity
                                                                      .data!.products!
                                                                      .elementAt(index)
                                                                      .supplierPhoto
                                                                      .toString(),
                                                                ),
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets.only(left: 10.h),
                                                                child: Text(
                                                                    productionListEntity
                                                                        .data!
                                                                        .products!
                                                                        .elementAt(
                                                                        index)
                                                                        .supplierName ??
                                                                        "",style: TextStyle(fontSize: 12.sp,color: ColorsUtil.hexColor(0x7D7D7D),fontWeight: FontWeight.normal)),
                                                              ),

                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                      children: [
                                                        Container(margin: EdgeInsets.only(bottom: 15.h),
                                                          child: Text((productionListEntity
                                                              .data!
                                                              .products!
                                                              .elementAt(
                                                              index)
                                                              .priceString ??
                                                              "") +
                                                              (productionListEntity
                                                                  .data!
                                                                  .products!
                                                                  .elementAt(
                                                                  index)
                                                                  .priceUnit ??
                                                                  ""),style: TextStyle(fontSize: 18.sp,color: ColorsUtil.hexColor(0xffffff),fontWeight: FontWeight.bold)),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),

                                              ))
                                            ],
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              RouteUtil.createRoute(ProductDetailPage(
                                                  "${productionListEntity.data!.products!.elementAt(index).id}")));
                                        },
                                      )
                                    ],
                                  );
                                },
                                childCount: productionListEntity
                                    .data!.products!.length),
                            itemExtent: 471.h)
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 32.h,
                      child: Offstage(
                        offstage: isLogin,
                        child: Container(
                          margin: EdgeInsets.only(left: 15.w,right: 15.w),
                          padding: EdgeInsets.only(left: 15.w,right: 15.w),
                          height: 45.h,
                          width: 1.sw-30.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.w),
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    ColorsUtil.hexColor(0xF4CD6F, alpha: 1),
                                    ColorsUtil.hexColor(0xF7BD50, alpha: 1),
                                  ])
                              ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Text(
                                  "登录玄梦阁，开启您的数字藏品之旅",
                                  style: TextStyle(
                                    color: ColorsUtil.hexColor(0x1A0F00),
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold
                                  ),
                                )
                              ),
                              InkWell(
                                child: Container(
                                  width: 60.w,
                                  height: 28.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.w),
                                    color: ColorsUtil.hexColor(0x1B1B1B,
                                        alpha: 1),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "去登录",
                                      style: TextStyle(
                                          color: ColorsUtil.hexColor(0xECBA52),
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(context,
                                      RouteUtil.createRoute(LoginPage(false)));
                                },
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isLogin = !isLogin;
                                  });
                                },
                                child: Container(
                                  child: Icon(Icons.close,color: ColorsUtil.hexColor(0x1E201F),),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            );
        }
      },
      future: resultData,
    );
  }

  void _onLoading() async {
    _refreshController.loadNoData();
  }

  @override
  bool get wantKeepAlive => true;
}
