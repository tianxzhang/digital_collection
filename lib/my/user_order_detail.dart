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
                      height: 35.h,
                      color: ColorsUtil.hexColor(0x343635),
                      child: Row(
                        children: [
                          Container(
                            width: 15.w,
                            height: 15.w,
                            child: Image.asset("assets/28.png"),
                          ),
                          Container(
                            child: Text("抢购成功以付款为结果",
                                style: TextStyle(
                                    color: ColorsUtil.hexColor(0xB5B5B5),
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
          }
        },
        future: resultData,
      ),
    );
  }
}
