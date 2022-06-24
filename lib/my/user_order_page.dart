import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class UserOrderPage extends StatefulWidget {
  @override
  UserOrderPageState createState() => UserOrderPageState();
}

class UserOrderPageState extends State<UserOrderPage>
    with AutomaticKeepAliveClientMixin {
  var resultData;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Container(
          // height: 22.h,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          padding: EdgeInsets.only(
              top: MediaQueryData.fromWindow(window).padding.top + 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "assets/login_leftarrow.png",
                      width: 12.w,
                      height: 12.w,
                      fit: BoxFit.fill,
                    ),
                  )),
              Text("我的订单"),
              Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: Container(width: 10.w,),
              ),
            ],
          ),
        ),
        preferredSize: Size(
          MediaQueryData.fromWindow(window).size.width,
          MediaQueryData.fromWindow(window).padding.top + 17.h,
        ),
      ),
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
    );
  }
}
