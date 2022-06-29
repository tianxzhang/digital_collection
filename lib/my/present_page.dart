import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:digital_collection/my/model/present_entity.dart';
import 'package:digital_collection/util/color_util.dart';
import 'package:digital_collection/util/network_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PresentPage extends StatefulWidget {
  final String id;

  PresentPage(this.id);

  @override
  PresentPageState createState() => PresentPageState();
}

class PresentPageState extends State<PresentPage>
    with AutomaticKeepAliveClientMixin {
  var resultData;
  PresentEntity presentEntity = PresentEntity();
  var shoujihao = new TextEditingController();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    resultData = getData();
  }

  Future getData() async {
    Map<String, String> postMap = Map<String, String>();
    postMap['cowry_id'] = widget.id;
    var result = await NetWorkUtil.getHttpQuery("/n/transfer/info", postMap);
    Map<String, dynamic> resultMap = json.decode(result.toString());
    presentEntity = PresentEntity.fromJson(resultMap);
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
            return Scaffold(
              backgroundColor: ColorsUtil.hexColor(0x1E201F),
              body: Container(
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
                    SliverToBoxAdapter(
                      child: Container(
                        margin: EdgeInsets.only(top: 13.h),
                        height: 1.h,
                        color: ColorsUtil.hexColor(0x2D302E),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        margin: EdgeInsets.only(left: 15.w,top: 18.h),
                        child: Text("将以下藏品转赠给好友",style: TextStyle(
                            fontSize: 15.sp,
                            color: ColorsUtil.hexColor(0xffffff),
                            fontWeight: FontWeight.normal)),
                      ),
                    ),
                    SliverToBoxAdapter(
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
                              width: 120.w,
                              height: 120.h,
                              child: CachedNetworkImage(
                                fit: BoxFit.fitHeight,
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
                                imageUrl: presentEntity.data?.productPhoto??"",
                              ),
                            ),
                            Expanded(child: Container(
                              height: 120.h,
                              padding: EdgeInsets.all(12.w),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              child: Text(presentEntity.data?.productName??"",
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
                                                  child: Text("${presentEntity.data?.convertType??""}",
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
                                          margin: EdgeInsets.only(top: 13.h),
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
                                                  presentEntity.data?.hashId ??
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
                                          ))
                                    ],
                                  )
                                  ,
                                  Container(
                                    child: Text(presentEntity.data?.authorName??"",
                                        style: TextStyle(
                                            color: ColorsUtil.hexColor(0x7D7D7D),
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        margin: EdgeInsets.only(left: 15.w),
                        child: Row(
                          children: [
                            Container(
                              width: 18.w,
                              height: 18.h,
                              child: Image.asset("assets/30.png"),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 6.w),
                              child: Text("请输入好友手机号：",
                                  style: TextStyle(
                                      color: ColorsUtil.hexColor(0xffffff),
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                          margin: EdgeInsets.only(
                            left: 25.w, right: 25.w, top: 12.h,),
                          padding: EdgeInsets.only(left: 25.w),
                          // width: 100.w,
                          // height: 16.h,
                          decoration: new BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(25.w)),
                              // border: Border.all(
                              //   color: ColorsUtil.hexColor(0xF2F2F2),
                              //   width: 1.w,
                              //   style: BorderStyle.solid,
                              // ),
                              color: ColorsUtil.hexColor(0xffffff,alpha: 0.1)),
                          child: TextField(
                            controller: shoujihao,
                            cursorColor:
                            ColorsUtil.hexColor(0x9F9F9F),
                            //设置光标
                            decoration: InputDecoration(
//                        contentPadding: const EdgeInsets.symmetric(vertical: 9.8),
                                border: InputBorder.none,
                                hintText: "请输入手机号",
                                hintStyle: new TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.normal,
                                    color: ColorsUtil.hexColor(
                                        0x7D7D7D))),
                            maxLines: 1,
                            // maxLength: 10,
                            //最大行数
                            autofocus: false,
                            //是否自动对焦
                            obscureText: false,
                            enabled: true,
                            //是否是密码
//                  textAlign: TextAlign.center,//文本对齐方式
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.normal,
                                color: ColorsUtil.hexColor(
                                    0x7D7D7D)),
                            //输入文本的样式
                            onChanged: (text) {
                              print('change $text' +
                                  text.length.toString());
                            },
                            onSubmitted: (text) {
                              print('submit $text');
                              FocusScope.of(context)
                                  .requestFocus(FocusNode());
                            },
                          )
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        margin: EdgeInsets.only(left: 15.w,top: 35.h),
                        child: Row(
                          children: [
                            Container(
                              width: 18.w,
                              height: 18.h,
                              child: Image.asset("assets/31.png"),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 6.w),
                              child: Text("转赠说明",
                                  style: TextStyle(
                                      color: ColorsUtil.hexColor(0xffffff),
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        margin: EdgeInsets.only(left: 15.w,top: 15.h),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("${presentEntity.data?.descList??""}",
                                  style: TextStyle(
                                      color: ColorsUtil.hexColor(0xBBBBBB ),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.normal),softWrap: true,maxLines: 10,),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        margin: EdgeInsets.only(left: 15.w,top: 50.h),
                        child: Row(
                          children: [
                            Container(
                              width: 18.w,
                              height: 18.h,
                              child: Image.asset("assets/32.png"),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 7.w),
                              child: Text("此次转赠需支付手续费 ${presentEntity.data?.productPrice}${presentEntity.data?.productUnit}",
                                  style: TextStyle(
                                      color: ColorsUtil.hexColor(0xDBDBDB ),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: Container(
                height: 70.h,
                color: ColorsUtil.hexColor(0x101010),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                              '${presentEntity.data?.productPrice}${presentEntity.data?.productUnit}',
                              style: TextStyle(
                                  fontSize: 27.sp,
                                  color: ColorsUtil.hexColor(0xffffff),
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 120.w,
                            height: 45.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: ColorsUtil.hexColor(0xF7BD50),
                                borderRadius: BorderRadius.circular(35)),
                            child: Text("确认转赠",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: ColorsUtil.hexColor(0xffffff),
                                    fontWeight: FontWeight.bold)),
                          )
                        ],
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
