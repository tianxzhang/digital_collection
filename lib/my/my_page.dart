// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:digital_collection/login_register/login_page.dart';
import 'package:digital_collection/my/collection_detail.dart';
import 'package:digital_collection/my/model/collection_entity.dart';
import 'package:digital_collection/my/present_record.dart';
import 'package:digital_collection/my/setting_page.dart';
import 'package:digital_collection/my/user_info_page.dart';
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
              margin: EdgeInsets.all(15.w),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: InkWell(
                      child: Container(
                        height: 70.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 67.w,
                                  height: 67.w,
                                  child: CachedNetworkImage(
                                    fit: BoxFit.fill,
                                    httpHeaders: const {
                                      'referer': 'http://app.xuanmengge.com'
                                    },
                                    placeholder: (context, url) => Container(
                                      child: Center(
                                        child: CupertinoActivityIndicator(),
                                      ),
                                    ),
                                    imageBuilder: (context, imageProvider) =>
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
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                    imageUrl: "${userInfoEntity.data?.photo}",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          userInfoEntity.data?.nickName ?? "",
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              color:
                                                  ColorsUtil.hexColor(0xffffff),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        height: 21.h,
                                        decoration: BoxDecoration(
                                            color:
                                                ColorsUtil.hexColor(0x343635),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        constraints:
                                            BoxConstraints(maxWidth: 169.w),
                                        margin: EdgeInsets.only(top: 20.h),
                                        padding: EdgeInsets.only(left: 7.5.w),
                                        alignment: Alignment.center,
                                        child: Text(
                                          userInfoEntity.data?.address ?? "",
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color:
                                                  ColorsUtil.hexColor(0xECBA52),
                                              fontWeight: FontWeight.bold),
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
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: ColorsUtil.hexColor(0xB5B5B5),
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        if (isLogin) {
                          Navigator.push(
                              context,
                              RouteUtil.createRoute(
                                  UserInfoPage(userInfoEntity.data!)));
                        }
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 165.h,
                      decoration: BoxDecoration(
                          color: ColorsUtil.hexColor(0x101010),
                          borderRadius: BorderRadius.circular(20)),
                      margin: EdgeInsets.only(top: 10.h),
                      padding: EdgeInsets.all(15.w),
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
                                        width: 40.w,
                                        height: 40.w,
                                        child: Image.asset("assets/1.png"),
                                      ),
                                      Container(
                                        child: Text(
                                          "我的订单",
                                          style: TextStyle(
                                            color:
                                                ColorsUtil.hexColor(0xB5B5B5),
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () async {
                                  Navigator.push(context,
                                      RouteUtil.createRoute(UserOrderPage()));
                                },
                              ),
                              GestureDetector(
                                child: Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 40.w,
                                        height: 40.w,
                                        child: Image.asset("assets/2.png"),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 3.h),
                                        child: Text(
                                          "转赠记录",
                                          style: TextStyle(
                                            color:
                                                ColorsUtil.hexColor(0xB5B5B5),
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () async {
                                  Navigator.push(
                                      context,
                                      RouteUtil.createRoute(PresentRecordPage()));
                                },
                              ),
                              GestureDetector(
                                child: Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 40.w,
                                        height: 40.w,
                                        child: Image.asset("assets/3.png"),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 3.h),
                                        child: Text(
                                          "分享",
                                          style: TextStyle(
                                            color:
                                                ColorsUtil.hexColor(0xB5B5B5),
                                            fontSize: 14.sp,
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
                                        width: 40.w,
                                        height: 40.w,
                                        child: Image.asset("assets/4.png"),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 3.h),
                                        child: Text(
                                          "设置",
                                          style: TextStyle(
                                            color:
                                                ColorsUtil.hexColor(0xB5B5B5),
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () async {
                                  Navigator.push(
                                      context,
                                      RouteUtil.createRoute(
                                          SettingPage(userInfoEntity.data!)));
                                },
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 40.w,
                                          height: 40.w,
                                          child: Image.asset("assets/5.png"),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 3.h),
                                          child: Text(
                                            "实名认证",
                                            style: TextStyle(
                                              color:
                                                  ColorsUtil.hexColor(0xB5B5B5),
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  onTap: () async {},
                                ),
                                Container(
                                  width: 45.w,
                                  margin: EdgeInsets.only(top: 3.h),
                                  child: Text(
                                    "",
                                    style: TextStyle(
                                      color: ColorsUtil.hexColor(0x333333),
                                      fontSize: 6.sp,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 45.w,
                                  margin: EdgeInsets.only(top: 3.h),
                                  child: Text(
                                    "",
                                    style: TextStyle(
                                      color: ColorsUtil.hexColor(0x333333),
                                      fontSize: 6.sp,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 45.w,
                                  margin: EdgeInsets.only(top: 3.h),
                                  child: Text(
                                    "",
                                    style: TextStyle(
                                      color: ColorsUtil.hexColor(0x333333),
                                      fontSize: 6.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                      child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20.h,bottom: 15.h),
                        child: Text(
                          "我的收藏: ",
                          style: TextStyle(
                            color: ColorsUtil.hexColor(0xB5B5B5),
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20.h,bottom: 15.h),
                        child: Text(
                          "${collectionEntity.data?.list?.length ?? 0}",
                          style: TextStyle(
                              color: ColorsUtil.hexColor(0xffffff),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )),
                  SliverToBoxAdapter(
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.h,
                        crossAxisSpacing: 10.w,
                        childAspectRatio: 0.6,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  httpHeaders: {
                                    'referer': 'http://app.xuanmengge.com'
                                  },
                                  placeholder: (context, url) => new Container(
                                    child: new Center(
                                      child: new CupertinoActivityIndicator(),
                                    ),
                                  ),
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    width: 169.w,
                                    height: 165.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.r),
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
                                  margin: EdgeInsets.only(top: 5.h),
                                  child: Text(
                                    collectionEntity.data?.list
                                            ?.elementAt(index)
                                            .productName ??
                                        "",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: ColorsUtil.hexColor(0xffffff),
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.only(top: 5.h),
                                    height: 20.h,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 20.w,
                                          height: 20.w,
                                          child: Image.asset("assets/7.png"),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color:
                                                  ColorsUtil.hexColor(0xF7BD50),
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          height: 16.h,
                                          width: 121.w,
                                          alignment: Alignment.center,
                                          child: Text(
                                            collectionEntity.data?.list
                                                    ?.elementAt(index)
                                                    .metaName ??
                                                "",
                                            style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              color:
                                                  ColorsUtil.hexColor(0x1C0F00),
                                              fontSize: 10.sp,
                                            ),
                                          ),
                                        )
                                      ],
                                    )),
                                Container(
                                  margin: EdgeInsets.only(top: 5.h),
                                  child: Text(
                                    collectionEntity.data?.list
                                            ?.elementAt(index)
                                            .supplierName ??
                                        "",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: ColorsUtil.hexColor(0x7D7D7D),
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                RouteUtil.createRoute(CollectionDetailPage(
                                    "${collectionEntity.data?.list?.elementAt(index).cowryId}")));
                          },
                        );
                      },
                      itemCount: (collectionEntity.data?.list?.length) ?? 0,
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
