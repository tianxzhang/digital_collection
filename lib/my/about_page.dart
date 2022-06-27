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
      backgroundColor: ColorsUtil.hexColor(0x1E201F),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
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
                        child: Text("关于我们",
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
                Container(
                  margin: EdgeInsets.only(top: 70.h),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          child: Image.asset(
                            "assets/21.png",
                            width: 83.w,
                            height: 83.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15.h),
                          child: Text("玄梦阁数藏",
                              style: TextStyle(
                                  color: ColorsUtil.hexColor(0xffffff),
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 9.h),
                          child: Text("Version 1.0.1",
                              style: TextStyle(
                                  color: ColorsUtil.hexColor(0xB5B5B5),
                                  fontSize: 14.sp,
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
                Container(
                  child: Text("Copyright@2022-2100",style: TextStyle(
                      color: ColorsUtil.hexColor(0xffffff),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold
                  )),
                )
                ,
               Container(
                 margin: EdgeInsets.only(bottom: 53.h,top: 22.h),
                 child:  Text("玄梦阁数藏版权所有",style: TextStyle(
                     color: ColorsUtil.hexColor(0xffffff),
                     fontSize: 15.sp,
                     fontWeight: FontWeight.bold
                 )),
               )
              ],
            )
          ],
        ),
      ),
    );
  }
}