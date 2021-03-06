import 'package:digital_collection/util/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OperateSuccessPage extends StatefulWidget {
  @override
  OperateSuccessPageState createState() => OperateSuccessPageState();
}

class OperateSuccessPageState extends State<OperateSuccessPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtil.hexColor(0x1E201F),
      body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(15.w),
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Container(
                          width: 20.w,
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: ColorsUtil.hexColor(0xB5B5B5),
                          ),
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
                Container(
                  margin: EdgeInsets.only(top: 13.h),
                  height: 1.h,
                  color: ColorsUtil.hexColor(0x2D302E),
                  width: 1.sw,
                ),
                Container(
                  width: 100.w,
                  height: 100.w,
                  margin: EdgeInsets.only(top: 32.h),
                  child: Image.asset(
                    "assets/25.png",
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 18.h),
                  child: Text("您的操作密码设置完成",
                      style: TextStyle(
                          fontSize: 21.sp,
                          color: ColorsUtil.hexColor(0xffffff),
                          fontWeight: FontWeight.bold)),
                ),
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: Container(
                    margin: EdgeInsets.only(top: 55.h),
                    width: 1.sw,
                    height: 50.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: ColorsUtil.hexColor(0xF7BD50)),
                    child: Center(
                      child: Text(
                        "完成",
                        style: TextStyle(
                            color: ColorsUtil.hexColor(0x1A0F00),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          )),
    );
  }
}
