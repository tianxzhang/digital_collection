import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_format/date_format.dart';
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
              body: Container(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                        child: Container(
                            margin: EdgeInsets.only(top: 20.h),
                            width: 150.w,
                            height: 100.h,
                            child: CachedNetworkImage(
                              fit: BoxFit.fitHeight,
                              httpHeaders: const {
                                'referer': 'http://app.xuanmengge.com'
                              },
                              placeholder: (context, url) => const Center(
                                child: CupertinoActivityIndicator(),
                              ),
                              imageBuilder: (context, imageProvider) => Container(
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
                              imageUrl:
                              collectionDetailEntity.data?.productImage ?? "",
                            ))),
                    SliverToBoxAdapter(
                      child: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text("空投凭证"),
                            Text(collectionDetailEntity.data?.metaName??""),
                            const Text("收藏者"),
                            Text(collectionDetailEntity.data?.collectorName??""),
                            const Text("藏品哈希值"),
                            Text(collectionDetailEntity.data?.hashId??""),
                            const Text("合约地址"),
                            Text(collectionDetailEntity.data?.contractId??""),
                            const Text("区块链平台"),
                            Text(collectionDetailEntity.data?.blockName??""),
                            const Text("创作者"),
                            Text(collectionDetailEntity.data?.supplierName??""),
                            const Text("生成时间"),
                            Text("${formatDate(DateTime.fromMillisecondsSinceEpoch((collectionDetailEntity.data?.createTime??0) * 1000), [yyyy, '-', mm, '-', dd,'  ', HH, ':', nn, ':', ss])}"),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              bottomNavigationBar: Container(
                height: 30.h,
                color: Colors.black38,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.wallet_giftcard),
                          Text('转赠')
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.exit_to_app),
                          Text('兑换')
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
