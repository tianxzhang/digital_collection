// ignore_for_file: prefer_const_constructors
import 'package:digital_collection/login_register/login_page.dart';
import 'package:digital_collection/util/color_util.dart';
import 'package:digital_collection/util/route_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            child: Center(
              child: Text("Home"),
            ),
          ),
          Positioned(
              bottom: 0.h,
              child: Offstage(
                offstage: isLogin,
                child: Container(
                  margin: EdgeInsets.only(left: 8.w),
                  width: 171.5.w,
                  height: 19.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.w),
                      // color: ColorsUtil.hexColor(0x000000, alpha: 0.5),
                      image: DecorationImage(
                          image: AssetImage("assets/home_login.png"),
                          fit: BoxFit.fill)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            isLogin = !isLogin;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 10.w),
                          child: Image.asset(
                            "assets/home_nologin.png",
                            width: 5.38.w,
                            height: 5.38.w,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            "登录即刻享受",
                            style: TextStyle(
                              color: ColorsUtil.hexColor(0xffffff),
                              fontSize: 5.sp,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        child: Container(
                          margin: EdgeInsets.only(right: 10.w),
                          width: 29.25.w,
                          height: 8.5.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.w),
                            color: ColorsUtil.hexColor(0x000000, alpha: 0.5),
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/home_loginbtn.png",
                                ),
                                fit: BoxFit.fill),
                          ),
                          child: Center(
                            child: Text(
                              "立即登录",
                              style: TextStyle(
                                  color: ColorsUtil.hexColor(0xFFFFFF),
                                  fontSize: 5.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context, RouteUtil.createRoute(LoginPage(false)));
                        },
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
