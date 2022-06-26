import 'package:digital_collection/util/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutPage extends StatefulWidget {
  @override
  AboutPageState createState() => AboutPageState();
}

class AboutPageState extends State<AboutPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 8.w, right: 8.w, top: 6.5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Container(
                          child: Icon(Icons.arrow_back_ios),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      Container(
                        child: Text("关于我们",
                            style: TextStyle(
                                color: ColorsUtil.hexColor(0x000000),
                                fontSize: 9.sp,
                                fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        width: 5.27.w,
                        child: Text(""),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30.5.h),
                  height: 100.h,
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          child: Image.asset(
                            "assets/start_page.png",
                            // width: 32.5.w,
                            height: 32.5.w,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 6.h),
                          child: Text("玄梦阁数藏",
                              style: TextStyle(
                                  color: ColorsUtil.hexColor(0x333333),
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.bold
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 3.h),
                          child: Text("Version 1.0.1",
                              style: TextStyle(
                                  color: ColorsUtil.hexColor(0x666666),
                                  fontSize: 6.sp,
                                  fontWeight: FontWeight.bold
                              )),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Copyright@2022-2100"),
                Text("玄梦阁数藏版权所有")
              ],
            )
          ],
        ),
      ),
    );
  }
}