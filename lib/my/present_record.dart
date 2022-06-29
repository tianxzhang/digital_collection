import 'dart:convert';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:digital_collection/my/model/present_record_entity.dart';
import 'package:digital_collection/my/present_record_detail.dart';
import 'package:digital_collection/my/user_order_detail.dart';
import 'package:digital_collection/util/color_util.dart';
import 'package:digital_collection/util/network_util.dart';
import 'package:digital_collection/util/route_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'model/user_order_entity.dart';

class PresentRecordPage extends StatefulWidget {
  @override
  PresentRecordPageState createState() => PresentRecordPageState();
}

class PresentRecordPageState extends State<PresentRecordPage>
    with AutomaticKeepAliveClientMixin {
  var resultData;
  PresentRecordEntity presentRecordEntity = PresentRecordEntity();
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
    var result = await NetWorkUtil.getHttpQuery("/n/transfer/orderList", postMap);
    Map<String, dynamic> resultMap = json.decode(result.toString());
    if (resultMap["code"] == 1) {
      presentRecordEntity = PresentRecordEntity.fromJson(resultMap);
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
                                child: Text("转赠记录",
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
                                    color: ColorsUtil.hexColor(0x343635),
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  margin: EdgeInsets.all(15.w),
                                  padding: EdgeInsets.all(12.w),
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 60.w,
                                            height: 60.w,
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
                                              imageUrl: presentRecordEntity.data?.list?.elementAt(index).productPhoto??"",
                                            ),
                                          ),
                                          Expanded(child: Container(
                                            margin: EdgeInsets.only(left: 12.w),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Container(
                                                        child: Text(presentRecordEntity.data?.list?.elementAt(index).productName??"",
                                                            style: TextStyle(
                                                                color: ColorsUtil.hexColor(0xffffff),
                                                                fontSize: 14.sp,
                                                                fontWeight: FontWeight.bold)),
                                                      ),
                                                      Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          Container(
                                                            child: Text(presentRecordEntity.data?.list?.elementAt(index).statusName??"",
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
                                                    margin: EdgeInsets.only(top: 10.h),
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
                                                            presentRecordEntity.data?.list
                                                                ?.elementAt(index)
                                                                .cowryNum ??
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
                                              ],
                                            ),
                                          ))
                                        ],
                                      ),
                                      Container(
                                        width: 323.w,
                                        height: 1.h,
                                        margin: EdgeInsets.only(top: 16.h),
                                        color: ColorsUtil.hexColor(0x414443),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 16.h),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              child: Text(
                                                  '转赠对象',
                                                  style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: ColorsUtil.hexColor(0xB5B5B5),
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                            Container(
                                              child: Text(
                                                  "${presentRecordEntity.data?.list?.elementAt(index).toPhone}",
                                                  style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: ColorsUtil.hexColor(0xB5B5B5),
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      RouteUtil.createRoute(PresentRecordDetailPage("${presentRecordEntity.data?.list?.elementAt(index).orderId}")));
                                },
                              );
                            },
                            childCount: presentRecordEntity.data?.list?.length??0),
                        itemExtent: 150.h)
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
