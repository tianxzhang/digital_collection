import 'dart:io';

import 'package:digital_collection/base/base_tab.dart';
import 'package:digital_collection/base/config_util.dart';
import 'package:digital_collection/base/webview_page.dart';
import 'package:digital_collection/util/color_util.dart';
import 'package:digital_collection/util/route_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  SharedPreferences? prefs;
  PackageInfo? _packageInfo;
  var resultData;
  @override
  void initState() {
    super.initState();
    resultData = getPrefs();
  }

  Future getPrefs() async {
    prefs = await SharedPreferences.getInstance();
    _packageInfo = await PackageInfo.fromPlatform();
    prefs!.setString("version", _packageInfo?.version??"");
    if(prefs!.getBool("isFirstLaunch")??true) {
      showPrivacyDialog();
    }else {
      await prefs!.setBool("isFirstLaunch", false);
      countDown();
    }
  }

  void showPrivacyDialog() {
    Future.delayed(Duration(milliseconds: 500),showFirstDialog);
  }

  Future<void> showFirstDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("用户协议和隐私政策",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
            content: RichText(
              text: TextSpan(
                text: "请你务必仔细审阅，充分理解“用户协议”和“隐私政策”各个条款，包括不限于：为了向你提供内容分享、后台播放等服务，我们需要收集你的设备信息、地区信息等个人信息。你可以在“设置”中关于玄梦阁数藏中再次查看或更改用户协议、隐私政策。你可阅读",
                style: TextStyle(
                    color: ColorsUtil
                        .hexColor(
                        0x333333),
                    fontSize:
                    6.sp,
                    fontWeight:
                    FontWeight
                        .normal),
                children: <
                    TextSpan>[
                  TextSpan(
                      text: "《用户协议》",
                      style: TextStyle(
                          color: ColorsUtil
                              .hexColor(
                              0xFD4F56),
                          fontSize: 6
                              .sp,
                          fontWeight:
                          FontWeight
                              .normal),
                      recognizer: TapGestureRecognizer()..onTap = () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WebViewPage(
                                  urlPath:
                                  ConfigUtil.baseUrl+"appApi/about",
                                  title: "用户协议",
                                )));
                      }
                  ),
                  TextSpan(
                      text:"和",
                      style: TextStyle(
                          color: ColorsUtil
                              .hexColor(
                              0x333333),
                          fontSize: 6
                              .sp,
                          fontWeight:
                          FontWeight
                              .normal)
                  ),
                  TextSpan(
                      text:"《隐私政策》",
                      style: TextStyle(
                          color: ColorsUtil
                              .hexColor(
                              0xFD4F56),
                          fontSize: 6
                              .sp,
                          fontWeight:
                          FontWeight
                              .normal),
                      recognizer: TapGestureRecognizer()..onTap = () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WebViewPage(
                                    urlPath:ConfigUtil.baseUrl+"appApi/privacy",
                                    title: "隐私政策")));
                      }
                  ),
                  TextSpan(
                      text:"了解详细信息。如你同意，请点击“同意”开始接收我们的服务！",
                      style: TextStyle(
                          color: ColorsUtil
                              .hexColor(
                              0x333333),
                          fontSize: 6
                              .sp,
                          fontWeight:
                          FontWeight
                              .normal)
                  )
                ],
              ),
            ),
            actions: <Widget>[
              Row(
                children: [
                  Expanded(child: FlatButton(
                    child: Text('暂不使用',
                        style: TextStyle(
                            color: ColorsUtil.hexColor(0x333333),
                            fontSize: 8.sp,
                            fontWeight: FontWeight.normal)),
                    onPressed: ()  async {
                      exit(0);
                    },
                  ))
                  ,
                  Expanded(child: FlatButton(
                    child: Text('同意',
                        style: TextStyle(
                            color: ColorsUtil.hexColor(0xFD4F56),
                            fontSize: 8.sp,
                            fontWeight: FontWeight.normal)),
                    onPressed: () async {
                      print('no...');
                      // player.start();
                      await prefs!.setBool("isFirstLaunch", false);
                      Navigator.of(context).pop();
                      countDown();
                    },
                  ))
                  ,
                ],
              )
            ],
          );
        },
        barrierDismissible: true)
        .then((value) {});
  }

  void countDown() {
    var _duration = new Duration(seconds: 2);
    new Future.delayed(_duration, newHomePage);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
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
                return Container(
                  child: Image.asset(
                    "assets/splash.png",
                    fit: BoxFit.fill,
                    width: 1.sw,
                    height: 1.sh,
                  ),
                );
            }
          },
          future: resultData,
        ),
      ),
    );
  }

  void newHomePage() async {
    Navigator.pushReplacement(
        context,
        RouteUtil.createRoute(BaseTabBar()));
  }
}