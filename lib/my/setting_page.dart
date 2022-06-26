import 'dart:ui';

import 'package:digital_collection/login_register/login_page.dart';
import 'package:digital_collection/my/about_page.dart';
import 'package:digital_collection/my/user_info_page.dart';
import 'package:digital_collection/util/color_util.dart';
import 'package:digital_collection/util/route_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

import 'model/user_info_entity.dart';

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
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.only(top: 15.h, left: 8.w, right: 8.w),
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
                            onTap: () {
                              Navigator.push(
                                  context, RouteUtil.createRoute(UserInfoPage(widget.userInfoData)));
                            },
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.admin_panel_settings_sharp),
                                    Container(
                                      child: Text("操作密码"),
                                    )
                                  ],
                                )
                                ,
                                Icon(Icons.arrow_forward_ios)
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
                                      Icon(Icons.mediation),
                                      Container(
                                        child: Text("关于我们"),
                                      )
                                    ],
                                  )
                                  ,
                                  Icon(Icons.arrow_forward_ios)
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
                                      Icon(Icons.mediation),
                                      Container(
                                        child: Text("联系客服"),
                                      )
                                    ],
                                  )
                                  ,
                                  Icon(Icons.arrow_forward_ios)
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
                      margin: EdgeInsets.only(top: 20.h, left: 8.w, right: 8.w),
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
                                      child: Text("用户协议"),
                                    )
                                  ],
                                )
                                ,
                                Icon(Icons.arrow_forward_ios)
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
                                    Icon(Icons.admin_panel_settings_sharp),
                                    Container(
                                      child: Text("隐私政策"),
                                    )
                                  ],
                                )
                                ,
                                Icon(Icons.arrow_forward_ios)
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
                                      Icon(Icons.mediation),
                                      Container(
                                        child: Text("检查更新"),
                                      )
                                    ],
                                  )
                                  ,
                                  Icon(Icons.arrow_forward_ios)
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
                          margin: EdgeInsets.only(left: 8.w, right: 8.w,top: 30.h),
                          width: 171.5.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.w),
                              color: Colors.grey
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
                                  color: Colors.deepOrange,
                                  fontSize: 8.sp,
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
