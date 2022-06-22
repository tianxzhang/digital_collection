import 'package:digital_collection/util/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewPage extends StatefulWidget {
  final String urlPath;
  final String title;

  WebViewPage({this.urlPath = "www.baidu.com", this.title="***"});

  @override
  WebViewPageState createState() => WebViewPageState();
}

class WebViewPageState extends State<WebViewPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.urlPath);
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title == null ? "" : widget.title,
            style: TextStyle(color: ColorsUtil.hexColor(0x2F2F2F))),
        leading: IconButton(
          icon:
          Icon(Icons.arrow_back_ios, color: ColorsUtil.hexColor(0x2F2F2F)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        brightness: Brightness.light,
        backgroundColor: Colors.white,
      ),
      body: Container(
        height: ScreenUtil().screenHeight,
        width: ScreenUtil().screenWidth,
        child: Center(
          child: WebviewScaffold(
            url: widget.urlPath,
          ),
        ),
      ),
    );
  }
}
