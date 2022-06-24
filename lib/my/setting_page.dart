import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingPage extends StatefulWidget {
  @override
  SettingPageState createState() => SettingPageState();
}

class SettingPageState extends State<SettingPage>
    with AutomaticKeepAliveClientMixin {
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
              Text("设置"),
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
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: 15.h, left: 8.w, right: 8.w),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.person),
                            Container(
                              child: Text("个人信息"),
                            )
                          ],
                        )
                        ,
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
