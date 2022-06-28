import 'package:digital_collection/util/color_util.dart';
import 'package:digital_collection/util/route_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pin_put/pin_put.dart';

import 'operate_success.dart';

class SetPasswordPage extends StatefulWidget {

  @override
  SetPasswordPageState createState() => SetPasswordPageState();
}

class SetPasswordPageState extends State<SetPasswordPage>
    with AutomaticKeepAliveClientMixin {
  final FocusNode _pinPutFocusNode = FocusNode();
  final FocusNode _pinPutFocusNode1 = FocusNode();
  final TextEditingController _pinPutController = TextEditingController();
  final TextEditingController _pinPutController1 = TextEditingController();
  String? passCode;
  String? verificationCode;

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      // border: Border.all(color: ColorsUtil.hexColor(ThemeColors.entryBorder)),
      borderRadius: BorderRadius.circular(15.0),
      color: ColorsUtil.hexColor(0x343635)
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtil.hexColor(0x1E201F),
      body: SafeArea(
        child: Container(
          child: Column(
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
              Container(margin: EdgeInsets.only(top: 13.h),height: 1.h,color: ColorsUtil.hexColor(0x2D302E),width: 375.w,),
              Container(
                margin: EdgeInsets.only(top: 36.h),
                child: Text("输入操作密码",
                    style: TextStyle(
                        fontSize: 24.sp,
                        color: ColorsUtil.hexColor(0xffffff),
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                margin: EdgeInsets.only(top: 21.h),
                child: Text("请输入6位数操作密码",
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: ColorsUtil.hexColor(0xB5B5B5),
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                margin: EdgeInsets.only(left: 35.w,top: 40.h,right: 5.w),
                child: Row(
                  children: [
                    Icon(Icons.lock,color: ColorsUtil.hexColor(0xB5B5B5),),
                    Container(
                      child: Text("设置密码",
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: ColorsUtil.hexColor(0xB5B5B5),
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 23.h, left: 35.w, right: 35.w),
                height: 43.h,
                child: PinPut(
                  fieldsCount: 6,
                  onSubmit: (String pin) => passCode = pin,
                  onChanged: (String pin) => passCode = pin,
                  focusNode: _pinPutFocusNode1,
                  controller: _pinPutController1,
                  submittedFieldDecoration: _pinPutDecoration.copyWith(
                      borderRadius: BorderRadius.circular(20.0),
                      color: ColorsUtil.hexColor(0x343635 )
                  ),
                  selectedFieldDecoration: _pinPutDecoration,
                  followingFieldDecoration: _pinPutDecoration.copyWith(
                      borderRadius: BorderRadius.circular(5.0),
                      color: ColorsUtil.hexColor(0x343635 )
                    // border: Border.all(
                    //   color: ColorsUtil.hexColor(ThemeColors.entryBorder),
                    // ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 35.w,top: 40.h,right: 5.w),
                child: Row(
                  children: [
                    Icon(Icons.lock,color: ColorsUtil.hexColor(0xB5B5B5),),
                    Container(
                      child: Text("确认密码",
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: ColorsUtil.hexColor(0xB5B5B5),
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 23.h, left: 35.w, right: 35.w),
                height: 43.h,
                child: PinPut(
                  fieldsCount: 6,
                  onSubmit: (String pin) => verificationCode = pin,
                  onChanged: (String pin) => verificationCode = pin,
                  focusNode: _pinPutFocusNode,
                  controller: _pinPutController,
                  submittedFieldDecoration: _pinPutDecoration.copyWith(
                    borderRadius: BorderRadius.circular(20.0),
                      color: ColorsUtil.hexColor(0x343635 )
                  ),
                  selectedFieldDecoration: _pinPutDecoration,
                  followingFieldDecoration: _pinPutDecoration.copyWith(
                    borderRadius: BorderRadius.circular(5.0),
                    color: ColorsUtil.hexColor(0x343635 )
                    // border: Border.all(
                    //   color: ColorsUtil.hexColor(ThemeColors.entryBorder),
                    // ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 28.h),
                child: Text("*建议避免设置生日、连续数字等",
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: ColorsUtil.hexColor(0xFFD86F),
                        fontWeight: FontWeight.bold)),
              ),
              InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Container(
                  margin: EdgeInsets.only(top: 39.h),
                  width: 1.sw-30.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorsUtil.hexColor(0xF7BD50)
                  ),
                  child: Center(
                    child: Text(
                      "确认",
                      style: TextStyle(
                          color: ColorsUtil.hexColor(0x1A0F00),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                      context, RouteUtil.createRoute(OperateSuccessPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}