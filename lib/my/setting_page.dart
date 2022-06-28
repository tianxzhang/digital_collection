import 'dart:ui';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:digital_collection/login_register/login_page.dart';
import 'package:digital_collection/my/about_page.dart';
import 'package:digital_collection/my/operate_password_page.dart';
import 'package:digital_collection/my/user_info_page.dart';
import 'package:digital_collection/util/color_util.dart';
import 'package:digital_collection/util/route_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

import 'model/user_info_entity.dart';
import 'modify_password_page.dart';

class SettingPage extends StatefulWidget {
  final UserInfoData userInfoData;

  SettingPage(this.userInfoData);

  @override
  SettingPageState createState() => SettingPageState();
}

class SettingPageState extends State<SettingPage>
    with AutomaticKeepAliveClientMixin {
  var resultData;
  late SharedPreferences prefs;
  bool setPass = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    resultData = getData();
  }

  Future getData() async {
    prefs = await SharedPreferences.getInstance();
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtil.hexColor(0x1E201F),
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
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: SafeArea(child: Container(
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
                          child: Text("个人信息",
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
                  ),),),
                  SliverToBoxAdapter(child: Container(margin: EdgeInsets.only(top: 13.h),height: 1.h,color: ColorsUtil.hexColor(0x2D302E),width: 375.w,),),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.only(top: 15.h, left: 15.w, right: 15.w),
                      decoration: BoxDecoration(color: ColorsUtil.hexColor(0x343635),borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.all(13.w),
                      child: Column(
                        children: [
                          InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 32.w,
                                        height: 32.w,
                                        child: Image.asset("assets/14.png"),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 9.w),
                                        child: Text("个人信息",style: TextStyle(
                                            color:
                                            ColorsUtil.hexColor(0xffffff),
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold
                                        )),
                                      )
                                    ],
                                  )
                                  ,
                                  Icon(Icons.arrow_forward_ios,color: ColorsUtil.hexColor(0xB5B5B5),)
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context, RouteUtil.createRoute(UserInfoPage(widget.userInfoData)));
                            },
                          ),
                          InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            child: Container(
                              margin: EdgeInsets.only(top: 10.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 32.w,
                                        height: 32.w,
                                        child: Image.asset("assets/15.png"),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 9.w),
                                        child: Text("操作密码",style: TextStyle(
                                            color:
                                            ColorsUtil.hexColor(0xffffff),
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold
                                        )),
                                      )
                                    ],
                                  )
                                  ,
                                  Icon(Icons.arrow_forward_ios,color: ColorsUtil.hexColor(0xB5B5B5))
                                ],
                              ),
                            ),
                            onTap: () {
                              if(!setPass) {
                                Navigator.push(
                                    context, RouteUtil.createRoute(ModifyPasswordPage()));
                              } else {
                                Navigator.push(
                                    context, RouteUtil.createRoute(OperatePasswordPage()));
                              }
                            },
                          )
                          ,
                          InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            child: Container(
                              margin: EdgeInsets.only(top: 10.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 32.w,
                                        height: 32.w,
                                        child: Image.asset("assets/16.png"),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 9.w),
                                        child: Text("关于我们",style: TextStyle(
                                            color:
                                            ColorsUtil.hexColor(0xffffff),
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold
                                        )),
                                      )
                                    ],
                                  )
                                  ,
                                  Icon(Icons.arrow_forward_ios,color: ColorsUtil.hexColor(0xB5B5B5))
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context, RouteUtil.createRoute(AboutPage()));
                            },
                          ),
                          InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            child: Container(
                              margin: EdgeInsets.only(top: 10.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 32.w,
                                        height: 32.w,
                                        child: Image.asset("assets/17.png"),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 9.w),
                                        child: Text("联系客服",style: TextStyle(
                                            color:
                                            ColorsUtil.hexColor(0xffffff),
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold
                                        )),
                                      )
                                    ],
                                  )
                                  ,
                                  Icon(Icons.arrow_forward_ios,color: ColorsUtil.hexColor(0xB5B5B5))
                                ],
                              ),
                            ),
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("联系方式"),
                                      content: Text("请关注：玄梦阁数藏，点击资讯客服",textAlign: TextAlign.center,),
                                      actions: <Widget>[
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            FlatButton(
                                              child: Text('确定',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 8.sp,
                                                      fontWeight: FontWeight.normal)),
                                              onPressed: () {
                                                print('no...');
                                                // player.start();
                                                Navigator.of(context).pop();
                                              },
                                            )
                                          ],
                                        )
                                      ],
                                    );
                                  },
                                  barrierDismissible: true)
                                  .then((value) {});
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.only(top: 18.h, left: 15.w, right: 15.w),
                      decoration: BoxDecoration(color: ColorsUtil.hexColor(0x343635),borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.all(13.w),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 32.w,
                                      height: 32.w,
                                      child: Image.asset("assets/18.png"),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 9.w),
                                      child: Text("用户协议",style: TextStyle(
                                          color:
                                          ColorsUtil.hexColor(0xffffff),
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold
                                      )),
                                    )
                                  ],
                                )
                                ,
                                Icon(Icons.arrow_forward_ios,color: ColorsUtil.hexColor(0xB5B5B5))
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 32.w,
                                      height: 32.w,
                                      child: Image.asset("assets/19.png"),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 9.w),
                                      child: Text("隐私政策",style: TextStyle(
                                          color:
                                          ColorsUtil.hexColor(0xffffff),
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold
                                      )),
                                    )
                                  ],
                                )
                                ,
                                Icon(Icons.arrow_forward_ios,color: ColorsUtil.hexColor(0xB5B5B5))
                              ],
                            ),
                          ),
                          InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            child: Container(
                              margin: EdgeInsets.only(top: 10.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 32.w,
                                        height: 32.w,
                                        child: Image.asset("assets/20.png"),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 9.w),
                                        child: Text("检查更新",style: TextStyle(
                                            color:
                                            ColorsUtil.hexColor(0xffffff),
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold
                                        )),
                                      )
                                    ],
                                  )
                                  ,
                                  Icon(Icons.arrow_forward_ios,color: ColorsUtil.hexColor(0xB5B5B5))
                                ],
                              ),
                            ),
                            onTap: () {
                              Toast.show("当前版本是最新版本");
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                      child: InkWell(
                        child: Container(
                          margin: EdgeInsets.only(left: 15.w, right: 15.w,top: 18.h),
                          width: 1.sw-30.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: ColorsUtil.hexColor(0x505251)
                            // color: ColorsUtil.hexColor(0x000000, alpha: 0.5),
                            // image: DecorationImage(
                            //     image: AssetImage(
                            //       "assets/home_loginbtn.png",
                            //     ),
                            //     fit: BoxFit.fill),
                          ),
                          child: Center(
                            child: Text(
                              "退出登录",
                              style: TextStyle(
                                  color: ColorsUtil.hexColor(0xFFD86F ),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        onTap: () {
                          prefs.setString("token", "");
                          prefs.setString("phone", "");
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(builder: (context) =>
                                  LoginPage(true)), (check) => false);
                        },
                      ),
                  )
                ],
              );
          }
        },
        future: resultData,
      ),


    );
  }
}
