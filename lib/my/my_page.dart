// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:digital_collection/login_register/login_page.dart';
import 'package:digital_collection/my/collection_detail.dart';
import 'package:digital_collection/my/model/collection_entity.dart';
import 'package:digital_collection/my/setting_page.dart';
import 'package:digital_collection/my/user_order_page.dart';
import 'package:digital_collection/util/color_util.dart';
import 'package:digital_collection/util/network_util.dart';
import 'package:digital_collection/util/route_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'model/user_info_entity.dart';

class MyPage extends StatefulWidget {
  @override
  MyPageState createState() => MyPageState();
}

class MyPageState extends State<MyPage>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  bool isLogin = false;
  int lastId = -1;
  late SharedPreferences prefs;
  var resultData;
  UserInfoEntity userInfoEntity = UserInfoEntity();
  CollectionEntity collectionEntity = CollectionEntity();

  @override
  void initState() {
    super.initState();
    resultData = getData();
  }

  Future getData() async {
    return Future.wait([getCollectionData(), getUserData()]);
  }

  Future getUserData() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.getString("token") != null && prefs.getString("token") != "") {
      setState(() {
        isLogin = true;
      });
    }
    Map<String, String> postMap = Map<String, String>();
    var result = await NetWorkUtil.getHttpQuery("/n/userInfo", postMap);
    Map<String, dynamic> resultMap = json.decode(result.toString());
    if (resultMap["code"] == 1) {
      userInfoEntity = UserInfoEntity.fromJson(resultMap);
      return;
    }
  }

  Future getCollectionData() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.getString("token") != null && prefs.getString("token") != "") {
      setState(() {
        isLogin = true;
      });
    }
    Map<String, String> postMap = new Map<String, String>();
    postMap['last_id'] = lastId.toString();
    var result = await NetWorkUtil.getHttpQuery("/n/store/List", postMap);
    Map<String, dynamic> resultMap = json.decode(result.toString());
    if (resultMap["code"] == 1) {
      var data = CollectionEntity.fromJson(resultMap);
      collectionEntity = data;
      return;
    }
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
                child: Container(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                      height: 60.h,
                      color: Colors.grey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                child: Image.asset(
                                  "assets/start_page.png",
                                  height: 20.h,
                                  width: 30.w,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              if (!isLogin) ...[
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "未登录",
                                    style: TextStyle(
                                        color: ColorsUtil.hexColor(0xffffff)),
                                  ),
                                )
                              ] else ...[
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        userInfoEntity.data?.nickName ?? "",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        userInfoEntity.data?.address ?? "",
                                        style: TextStyle(color: Colors.black),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                )
                              ]
                            ],
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Icon(Icons.arrow_forward_ios),
                          )
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.only(top: 10.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                child: Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Icon(Icons.person),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 3.h),
                                        child: Text(
                                          "我的订单",
                                          style: TextStyle(
                                            color:
                                                ColorsUtil.hexColor(0x333333),
                                            fontSize: 6.sp,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () async {
                                  Navigator.push(
                                      context, RouteUtil.createRoute(UserOrderPage()));
                                },
                              ),
                              GestureDetector(
                                child: Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Icon(Icons.credit_card_rounded),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 3.h),
                                        child: Text(
                                          "转赠记录",
                                          style: TextStyle(
                                            color:
                                                ColorsUtil.hexColor(0x333333),
                                            fontSize: 6.sp,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () async {},
                              ),
                              GestureDetector(
                                child: Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Icon(Icons.share),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 3.h),
                                        child: Text(
                                          "分享",
                                          style: TextStyle(
                                            color:
                                                ColorsUtil.hexColor(0x333333),
                                            fontSize: 6.sp,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () async {
                                  Share.share('玄梦阁数藏');
                                },
                              ),
                              GestureDetector(
                                child: Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Icon(Icons.settings),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 3.h),
                                        child: Text(
                                          "设置",
                                          style: TextStyle(
                                            color:
                                                ColorsUtil.hexColor(0x333333),
                                            fontSize: 6.sp,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () async {
                                  Navigator.push(
                                      context, RouteUtil.createRoute(SettingPage()));
                                },
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Icon(
                                              Icons.drive_file_rename_outline),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 3.h),
                                          child: Text(
                                            "实名认证",
                                            style: TextStyle(
                                              color:
                                                  ColorsUtil.hexColor(0x333333),
                                              fontSize: 6.sp,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  onTap: () async {},
                                ),
                                GestureDetector(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 20.w,
                                          margin: EdgeInsets.only(top: 3.h),
                                          child: Text(
                                            "",
                                            style: TextStyle(
                                              color:
                                                  ColorsUtil.hexColor(0x333333),
                                              fontSize: 6.sp,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  onTap: () async {},
                                ),
                                GestureDetector(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 20.w,
                                          margin: EdgeInsets.only(top: 3.h),
                                          child: Text(
                                            "",
                                            style: TextStyle(
                                              color:
                                                  ColorsUtil.hexColor(0x333333),
                                              fontSize: 6.sp,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  onTap: () async {},
                                ),
                                GestureDetector(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 20.w,
                                          margin: EdgeInsets.only(top: 3.h),
                                          child: Text(
                                            "",
                                            style: TextStyle(
                                              color:
                                                  ColorsUtil.hexColor(0x333333),
                                              fontSize: 6.sp,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  onTap: () async {},
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.only(top: 20.h),
                      child: Text(
                        "我的收藏",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.h,
                          // crossAxisSpacing: 30.w,
                          childAspectRatio: 1.35),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(right: 5.w),
                                    width: 72.5.w,
                                    height: 45.h,
                                    child: CachedNetworkImage(
                                      fit: BoxFit.contain,
                                      httpHeaders: {
                                        'referer': 'http://app.xuanmengge.com'
                                      },
                                      placeholder: (context, url) =>
                                          new Container(
                                        child: new Center(
                                          child:
                                              new CupertinoActivityIndicator(),
                                        ),
                                      ),
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.r),
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                      imageUrl: collectionEntity.data?.list
                                              ?.elementAt(index)
                                              .productCover ??
                                          "",
                                    )),
                                Container(
                                  child: Text(
                                    collectionEntity.data?.list
                                            ?.elementAt(index)
                                            .productName ??
                                        "",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: ColorsUtil.hexColor(0x333333),
                                      fontSize: 6.sp,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    collectionEntity.data?.list
                                            ?.elementAt(index)
                                            .metaName ??
                                        "",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: ColorsUtil.hexColor(0x333333),
                                      fontSize: 6.sp,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    collectionEntity.data?.list
                                            ?.elementAt(index)
                                            .supplierName ??
                                        "",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: ColorsUtil.hexColor(0x333333),
                                      fontSize: 6.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context, RouteUtil.createRoute(CollectionDetailPage("${collectionEntity.data?.list?.elementAt(index).cowryId}")));
                          },
                        );
                      },
                      itemCount: collectionEntity.data!.list!.length,
                    ),
                  ),
                  SliverToBoxAdapter(
                      child: Offstage(
                    offstage: isLogin,
                    child: Container(
//              margin: EdgeInsets.only(top: ScreenUtil().setWidth(50)),
                      margin: EdgeInsets.only(
                          top: ScreenUtil().setWidth(50),
                          left: ScreenUtil().setWidth(16.5),
                          right: ScreenUtil().setWidth(18),
                          bottom: 5.h),

                      width: ScreenUtil().setWidth(153),
                      height: ScreenUtil().setHeight(19),
                      child: MaterialButton(
                        onPressed: () async {
                          Navigator.push(
                              context, RouteUtil.createRoute(LoginPage(false)));
                        },
                        child: Container(
                            width: 30.w,
                            height: 15.h,
                            child: Center(
                              child: Text("登录",
                                  style: TextStyle(
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            )),
                        color: Colors.orange,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ))
                ],
              ),
            ));
        }
      },
      future: resultData,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
