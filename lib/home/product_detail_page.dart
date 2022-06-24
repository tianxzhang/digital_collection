import 'dart:convert';

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
    Map<String, dynamic> postMap = Map<String, dynamic>();
    postMap['id'] = widget.id;
    var result = await NetWorkUtil.postHttp("appApi/videoDetail", postMap);
    Map<String, dynamic> resultMap = json.decode(result.toString());

    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
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
                return Container();
            }
          },
          future: resultData,
        ),
      ),
    );
  }
}