import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:digital_collection/home/model/product_detail_entity.dart';
import 'package:digital_collection/util/color_util.dart';
import 'package:digital_collection/util/network_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetailPage extends StatefulWidget {
  final String id;

  ProductDetailPage(this.id);

  @override
  ProductDetailPageState createState() => ProductDetailPageState();
}

class ProductDetailPageState extends State<ProductDetailPage>
    with AutomaticKeepAliveClientMixin {
  var resultData;
  ProductDetailEntity productDetailEntity = ProductDetailEntity();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    resultData = getData();
  }

  Future getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("${widget.id} product detail id");
    Map<String, String> postMap = Map<String, String>();
    postMap['ProductId'] = widget.id;
    var result = await NetWorkUtil.getHttpQuery("/n/productInfo", postMap);
    Map<String, dynamic> resultMap = json.decode(result.toString());
    productDetailEntity = ProductDetailEntity.fromJson(resultMap);
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
              body: SafeArea(
                child: Container(
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Container(
                          margin: EdgeInsets.only(top: 25.h,left: 15.w,right: 15.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Icon(Icons.arrow_back_ios,color: ColorsUtil.hexColor(0xB5B5B5),),
                              ),
                              Container(
                                width: 21.w,
                                height: 21.w,
                                child: Image.asset("assets/detail_share.png",),
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
                                    borderRadius: BorderRadius.circular(5.r),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                                imageUrl: productDetailEntity
                                        .data?.info?.placeholder ??
                                    "",
                              ))
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
                                              width: 80.w,
                                              height: 1.h,
                                            ),
                                            Icon(
                                              Icons.lock,
                                              color:
                                                  ColorsUtil.hexColor(0x7D7D7D),
                                              size: 20.w,
                                            ),
                                            Text('购买后即可体验内容',
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: ColorsUtil.hexColor(
                                                        0x7D7D7D),
                                                    fontWeight:
                                                        FontWeight.normal)),
                                            Image.asset(
                                              "assets/detail_right.png",
                                              width: 80.w,
                                              height: 1.h,
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 13.h),
                                        child: Text(
                                            "${productDetailEntity.data?.info?.supplierName} • ${productDetailEntity.data?.info?.productName}",
                                            style: TextStyle(
                                                fontSize: 21.sp,
                                                color: ColorsUtil.hexColor(
                                                    0xffffff),
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(top: 15.h),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                width: 32.w,
                                                height: 16.h,
                                                child: Image.asset(
                                                  'assets/limited.png',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Container(
                                                width: 49.w,
                                                height: 16.h,
                                                color: ColorsUtil.hexColor(
                                                    0x4B4B4B),
                                                alignment: Alignment.center,
                                                child: Text(
                                                    "${productDetailEntity.data!.info?.sellCount}份",
                                                    style: TextStyle(
                                                        fontSize: 12.sp,
                                                        color:
                                                            ColorsUtil.hexColor(
                                                                0xE5BB64),
                                                        fontWeight:
                                                            FontWeight.bold)),
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
                          margin: EdgeInsets.all(15.w),
                          padding: EdgeInsets.all(15.w),
                          decoration: BoxDecoration(
                              color: ColorsUtil.hexColor(0x292B2B),
                              borderRadius: BorderRadius.circular(20.r)),
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      width: 38.w,
                                      height: 38.w,
                                      margin: EdgeInsets.only(right: 6.w),
                                      child: CachedNetworkImage(
                                        fit: BoxFit.fill,
                                        placeholder: (context, url) =>
                                            Container(
                                          child: Center(
                                            child: CupertinoActivityIndicator(),
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
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                        imageUrl:
                                            "${productDetailEntity.data?.info?.supplierPhoto}",
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text('创作者',
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: ColorsUtil.hexColor(
                                                      0x7D7D7D),
                                                  fontWeight:
                                                      FontWeight.normal)),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 8.w),
                                          child: Text(
                                              "${productDetailEntity.data?.info?.supplierName}",
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: ColorsUtil.hexColor(
                                                      0xffffff),
                                                  fontWeight: FontWeight.bold)),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 16.h),
                                width: 323.w,
                                height: 1.h,
                                color: ColorsUtil.hexColor(0x414443),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 15.h),
                                child: Text('作品故事',
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        color: ColorsUtil.hexColor(0xffffff),
                                        fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                width: 319.w,
                                margin: EdgeInsets.only(right: 6.w),
                                child: CachedNetworkImage(
                                  fit: BoxFit.fitWidth,
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
                                      // shape: BoxShape.circle,
                                      borderRadius:
                                      BorderRadius.circular(
                                          5.r),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                  imageUrl:
                                      "${productDetailEntity.data?.info?.productDescImage}",
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
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
                    Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                              '${productDetailEntity.data?.info?.priceString}${productDetailEntity.data?.info?.priceUnit}',
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
                                color: ColorsUtil.hexColor(0x505251),
                                borderRadius: BorderRadius.circular(35)),
                            child: Text("即将开售",
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
