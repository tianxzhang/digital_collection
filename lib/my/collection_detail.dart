import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_format/date_format.dart';
import 'package:digital_collection/my/present_page.dart';
import 'package:digital_collection/util/color_util.dart';
import 'package:digital_collection/util/route_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:digital_collection/my/model/collection_detail_entity.dart';
import 'package:digital_collection/util/network_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CollectionDetailPage extends StatefulWidget {
  final String id;

  CollectionDetailPage(this.id);

  @override
  CollectionDetailPageState createState() => CollectionDetailPageState();
}

class CollectionDetailPageState extends State<CollectionDetailPage>
    with AutomaticKeepAliveClientMixin {
  var resultData;
  late SharedPreferences prefs;
  CollectionDetailEntity collectionDetailEntity = CollectionDetailEntity();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    resultData = getData();
  }

  Future getData() async {
    prefs = await SharedPreferences.getInstance();
    Map<String, String> postMap = Map<String, String>();
    postMap['cowry_id'] = widget.id.toString();
    var result = await NetWorkUtil.getHttpQuery("/n/store/Info", postMap);
    Map<String, dynamic> resultMap = json.decode(result.toString());
    if (resultMap["code"] == 1) {
      collectionDetailEntity = CollectionDetailEntity.fromJson(resultMap);
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
            return Scaffold(
              backgroundColor: ColorsUtil.hexColor(0x1E201F),
              body: SafeArea(
                child: Container(
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Container(
                          margin: EdgeInsets.only(
                              top: 25.h, left: 15.w, right: 15.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: ColorsUtil.hexColor(0xB5B5B5),
                                ),
                              ),
                              Container(
                                width: 21.w,
                                height: 21.w,
                                child: Image.asset(
                                  "assets/detail_share.png",
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 29.h),
                              width: 243.w,
                              height: 243.w,
                              padding: EdgeInsets.only(
                                  bottom: 25.h,
                                  left: 25.w,
                                  right: 25.w,
                                  top: 18.h),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      "assets/detail_frame.png",
                                    ),
                                    fit: BoxFit.fill),
                              ),
                              child: CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  httpHeaders: const {
                                    'referer': 'http://app.xuanmengge.com'
                                  },
                                  placeholder: (context, url) => const Center(
                                        child: CupertinoActivityIndicator(),
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
                                  imageUrl: collectionDetailEntity
                                          .data?.productImage ??
                                      ""))
                        ],
                      )),
                      SliverToBoxAdapter(
                          child: Container(
                        height: 220.h,
                        child: Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 290.w,
                                  height: 176.h,
                                  child: Image.asset(
                                    "assets/detail_foundation.png",
                                    fit: BoxFit.fill,
                                  ),
                                )
                              ],
                            ),
                            Positioned(
                                top: 105.h,
                                child: Container(
                                  margin: EdgeInsets.only(
                                    left: 15.w,
                                    right: 15.w,
                                  ),
                                  width: 1.sw - 30.w,
                                  height: 109.h,
                                  decoration: BoxDecoration(
                                      color: ColorsUtil.hexColor(0x292B2B),
                                      borderRadius:
                                          BorderRadius.circular(20.r)),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 15.h),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "assets/detail_left.png",
                                              width: 40.w,
                                              height: 1.h,
                                            ),
                                            Text(
                                                "${collectionDetailEntity.data?.supplierName ?? ""} • ${collectionDetailEntity.data?.productName ?? ""}",
                                                style: TextStyle(
                                                    fontSize: 21.sp,
                                                    color: ColorsUtil.hexColor(
                                                        0xffffff),
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Image.asset(
                                              "assets/detail_right.png",
                                              width: 40.w,
                                              height: 1.h,
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(top: 25.h),
                                          height: 20.h,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 20.w,
                                                height: 20.w,
                                                child:
                                                    Image.asset("assets/7.png"),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: ColorsUtil.hexColor(
                                                        0xF7BD50),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                height: 16.h,
                                                width: 121.w,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  collectionDetailEntity
                                                          .data?.metaName ??
                                                      "",
                                                  style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: ColorsUtil.hexColor(
                                                        0x1C0F00),
                                                    fontSize: 10.sp,
                                                  ),
                                                ),
                                              )
                                            ],
                                          )),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      )),
                      SliverToBoxAdapter(
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 15.w, right: 15.w, top: 15.h),
                          padding: EdgeInsets.all(15.w),
                          decoration: BoxDecoration(
                              color: ColorsUtil.hexColor(0x292B2B),
                              borderRadius: BorderRadius.circular(20.r)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10.h),
                                child: Text("空投凭证",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: ColorsUtil.hexColor(0x7D7D7D),
                                        fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 13.h),
                                child: Text(collectionDetailEntity.data?.metaName ?? "",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        color: ColorsUtil.hexColor(0xffffff),
                                        fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 32.h),
                                child: Text("收藏者",
                                    style: TextStyle(
                                    fontSize: 14.sp,
                                    color: ColorsUtil.hexColor(0x7D7D7D),
                                  fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                child: Text(collectionDetailEntity.data?.collectorName ??
                                    "",style: TextStyle(
                                    fontSize: 16.sp,
                                    color: ColorsUtil.hexColor(0xffffff),
                                    fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 32.h),
                                child: Text("藏品哈希值",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: ColorsUtil.hexColor(0x7D7D7D),
                                        fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 28.h),
                                padding: EdgeInsets.symmetric(horizontal: 7.5.w),
                                height: 36.h,
                                width: 1.sw-30.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(color: ColorsUtil.hexColor(0xF7BD50),borderRadius: BorderRadius.circular(30)),
                                child: Text(collectionDetailEntity.data?.hashId ?? "",
                                  style: TextStyle(
                                    color: ColorsUtil.hexColor(0x1A0F00 ),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),maxLines: 3,softWrap: true,textAlign: TextAlign.center,),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 32.h),
                                child: Text("合约地址",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: ColorsUtil.hexColor(0x7D7D7D),
                                        fontWeight: FontWeight.bold)),
                              )
                              ,
                              Text(collectionDetailEntity.data?.contractId ??
                                  "",style: TextStyle(
                                  fontSize: 16.sp,
                                  color: ColorsUtil.hexColor(0xffffff),
                                  fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                              Container(
                                margin: EdgeInsets.only(top: 32.h),
                                child: Text("区块链平台",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: ColorsUtil.hexColor(0x7D7D7D),
                                        fontWeight: FontWeight.bold)),
                              )
                              ,
                              Text(
                                  collectionDetailEntity.data?.blockName ?? "",style: TextStyle(
                                  fontSize: 16.sp,
                                  color: ColorsUtil.hexColor(0xffffff),
                                  fontWeight: FontWeight.bold)),
                              Container(
                                margin: EdgeInsets.only(top: 32.h),
                                child: Text("创作者",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: ColorsUtil.hexColor(0x7D7D7D),
                                        fontWeight: FontWeight.bold)),
                              )
                              ,
                              Text(collectionDetailEntity.data?.supplierName ??
                                  "",style: TextStyle(
                                  fontSize: 16.sp,
                                  color: ColorsUtil.hexColor(0xffffff),
                                  fontWeight: FontWeight.bold)),
                              Container(
                                margin: EdgeInsets.only(top: 32.h),
                                child: Text("生成时间",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: ColorsUtil.hexColor(0x7D7D7D),
                                        fontWeight: FontWeight.bold)),
                              )
                              ,
                              Text(
                                  "${formatDate(DateTime.fromMillisecondsSinceEpoch((collectionDetailEntity.data?.createTime ?? 0) * 1000), [
                                    yyyy,
                                    '-',
                                    mm,
                                    '-',
                                    dd,
                                    '  ',
                                    HH,
                                    ':',
                                    nn,
                                    ':',
                                    ss
                                  ])}",style: TextStyle(
                                  fontSize: 16.sp,
                                  color: ColorsUtil.hexColor(0xffffff),
                                  fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: Container(
                height: 70.h,
                color: ColorsUtil.hexColor(0x101010),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      child: Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [Container(
                            margin: EdgeInsets.only(right: 5.w),
                            width: 25.w,
                            height: 25.w,
                            child: Image.asset("assets/22.png",fit: BoxFit.fill,),
                          ), Text('转赠',style: TextStyle(
                              fontSize: 14.sp,
                              color: ColorsUtil.hexColor(0xB5B5B5 ),
                              fontWeight: FontWeight.bold))],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context, RouteUtil.createRoute(PresentPage(widget.id)));
                      },
                    ),
                    Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [Container(
                          margin: EdgeInsets.only(right: 5.w),
                          width: 25.w,
                          height: 25.w,
                          child: Image.asset("assets/23.png",fit: BoxFit.fill,),
                        ), Text('兑换',style: TextStyle(
                            fontSize: 14.sp,
                            color: ColorsUtil.hexColor(0xB5B5B5 ),
                            fontWeight: FontWeight.bold))],
                      ),
                    ),
                  ],
                ),
              ),
            );
        }
      },
      future: resultData,
    );
  }
}
