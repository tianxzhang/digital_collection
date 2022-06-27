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
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 8.w, right: 8.w),
                                            height: 200.h,
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
                                                  .supplierPhoto
                                                  .toString(),
                                            ),
                                          ),
                                          Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  child: Text(
                                                      productionListEntity
                                                              .data!.products!
                                                              .elementAt(index)
                                                              .productName ??
                                                          ""),
                                                ),
                                                Container(
                                                  child: Text(
                                                      "${productionListEntity.data!.products!.elementAt(index).sellCount}"),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      child: Text(
                                                          productionListEntity
                                                                  .data!
                                                                  .products!
                                                                  .elementAt(
                                                                      index)
                                                                  .supplierName ??
                                                              ""),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Container(
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
                                                                  "")),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
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
                            itemExtent: 450.h)
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 0.h,
                      child: Offstage(
                        offstage: isLogin,
                        child: Container(
                          margin: EdgeInsets.only(left: 8.w),
                          width: 171.5.w,
                          height: 19.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.w),
                              // color: ColorsUtil.hexColor(0x000000, alpha: 0.5),
                              image: DecorationImage(
                                  image: AssetImage("assets/home_login.png"),
                                  fit: BoxFit.fill)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isLogin = !isLogin;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 10.w),
                                  child: Image.asset(
                                    "assets/home_nologin.png",
                                    width: 5.38.w,
                                    height: 5.38.w,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Container(
                                child: Center(
                                  child: Text(
                                    "登录即刻享受",
                                    style: TextStyle(
                                      color: ColorsUtil.hexColor(0xffffff),
                                      fontSize: 5.sp,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                child: Container(
                                  margin: EdgeInsets.only(right: 10.w),
                                  width: 29.25.w,
                                  height: 8.5.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.w),
                                    color: ColorsUtil.hexColor(0x000000,
                                        alpha: 0.5),
                                    image: DecorationImage(
                                        image: AssetImage(
                                          "assets/home_loginbtn.png",
                                        ),
                                        fit: BoxFit.fill),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "登录",
                                      style: TextStyle(
                                          color: ColorsUtil.hexColor(0xFFFFFF),
                                          fontSize: 5.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(context,
                                      RouteUtil.createRoute(LoginPage(false)));
                                },
                              )
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
