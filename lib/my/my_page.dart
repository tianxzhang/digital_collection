// ignore_for_file: prefer_const_constructors
import 'package:digital_collection/util/color_util.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyPage extends StatefulWidget {
  @override
  MyPageState createState() => MyPageState();
}

class MyPageState extends State<MyPage>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  bool isLogin = false;
  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 60.h,
              color: Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: Image.asset(
                          "assets/start_page.png",
                          height: 20.h,
                          width: 30.w,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "未登录",
                          style:
                              TextStyle(color: ColorsUtil.hexColor(0xffffff)),
                        ),
                      )
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Icon(Icons.arrow_forward_ios),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                child: Icon(Icons.person),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 3.h),
                                child: Text(
                                  "我的订单",
                                  style: TextStyle(
                                    color: ColorsUtil.hexColor(0x333333),
                                    fontSize: 6.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () async {},
                      ),
                      GestureDetector(
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                child: Icon(Icons.person),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 3.h),
                                child: Text(
                                  "我的订单",
                                  style: TextStyle(
                                    color: ColorsUtil.hexColor(0x333333),
                                    fontSize: 6.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () async {},
                      ),
                      GestureDetector(
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                child: Icon(Icons.person),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 3.h),
                                child: Text(
                                  "我的订单",
                                  style: TextStyle(
                                    color: ColorsUtil.hexColor(0x333333),
                                    fontSize: 6.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () async {},
                      ),
                      GestureDetector(
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                child: Icon(Icons.person),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 3.h),
                                child: Text(
                                  "我的订单",
                                  style: TextStyle(
                                    color: ColorsUtil.hexColor(0x333333),
                                    fontSize: 6.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () async {},
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                child: Icon(Icons.person),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 3.h),
                                child: Text(
                                  "我的订单",
                                  style: TextStyle(
                                    color: ColorsUtil.hexColor(0x333333),
                                    fontSize: 6.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () async {},
                      ),
                      GestureDetector(
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                child: Icon(Icons.person),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 3.h),
                                child: Text(
                                  "我的订单",
                                  style: TextStyle(
                                    color: ColorsUtil.hexColor(0x333333),
                                    fontSize: 6.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () async {},
                      ),
                      GestureDetector(
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                child: Icon(Icons.person),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 3.h),
                                child: Text(
                                  "我的订单",
                                  style: TextStyle(
                                    color: ColorsUtil.hexColor(0x333333),
                                    fontSize: 6.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () async {},
                      ),
                      GestureDetector(
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                child: Icon(Icons.person),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 3.h),
                                child: Text(
                                  "我的订单",
                                  style: TextStyle(
                                    color: ColorsUtil.hexColor(0x333333),
                                    fontSize: 6.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () async {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: 20.h),
              child: Text(
                "我的收藏",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
//              margin: EdgeInsets.only(top: ScreenUtil().setWidth(50)),
              margin: EdgeInsets.only(
                  top: ScreenUtil().setWidth(50),
                  left: ScreenUtil().setWidth(16.5),
                  right: ScreenUtil().setWidth(18),
                  bottom: 5.h),

              width: ScreenUtil().setWidth(153),
              height: ScreenUtil().setHeight(19),
              child: MaterialButton(
                onPressed: () async {
                  // if (!xieyi) {
                  //   Fluttertoast.showToast(
                  //       msg: "请勾选协议",
                  //       toastLength: Toast.LENGTH_SHORT,
                  //       gravity: ToastGravity.CENTER,
                  //       timeInSecForIosWeb: 1,
                  //       backgroundColor: Colors.black,
                  //       textColor: Colors.white,
                  //       fontSize: 6.5.sp);
                  //   return;
                  // }
                  // var phone = CommonUtil.noBlank(shoujihao.text.toString());
                  // if (phone == null || phone.length == 0) {
                  //   Fluttertoast.showToast(
                  //       msg: "请输入手机号",
                  //       toastLength: Toast.LENGTH_SHORT,
                  //       gravity: ToastGravity.CENTER,
                  //       timeInSecForIosWeb: 1,
                  //       backgroundColor: Colors.black,
                  //       textColor: Colors.white,
                  //       fontSize: 6.5.sp);
                  //   return;
                  // }
                  // if (!CommonUtil.isChinaPhoneLegal(phone)) {
                  //   Fluttertoast.showToast(
                  //       msg: "手机号输入有误",
                  //       toastLength: Toast.LENGTH_SHORT,
                  //       gravity: ToastGravity.CENTER,
                  //       timeInSecForIosWeb: 1,
                  //       backgroundColor: Colors.black,
                  //       textColor: Colors.white,
                  //       fontSize: 6.5.sp);
                  //   return;
                  // }
                  // if (yazhengma.text.toString() == null ||
                  //     yazhengma.text.length < 6) {
                  //   Fluttertoast.showToast(
                  //       msg: "请输入密码",
                  //       toastLength: Toast.LENGTH_SHORT,
                  //       gravity: ToastGravity.CENTER,
                  //       timeInSecForIosWeb: 1,
                  //       backgroundColor: Colors.black,
                  //       textColor: Colors.white,
                  //       fontSize: 6.5.sp);
                  //   return;
                  // }
                  // Map<String, dynamic> postMap = new Map<String, dynamic>();
                  // postMap['phone'] =
                  //     CommonUtil.noBlank(shoujihao.text.toString());
                  // postMap['pass'] = CommonUtil.generateMd5(yazhengma.text);
                  // postMap['login_type'] = 3;
                  //
                  // var result =
                  // await NetWorkUtil.postHttp("appApi/login", postMap);
                  // Map resultMap = json.decode(result.toString());
                  // if (resultMap["code"] == 200) {
                  //   SharedPreferences prefs = await SharedPreferences.getInstance();
                  //   await prefs.setString("token", resultMap["data"]["token"]);
                  //   await prefs.setString("phone", CommonUtil.noBlank(shoujihao.text.toString()));
                  //   if (resultMap["data"]["new"] == true) {
                  //     Navigator.pushAndRemoveUntil(
                  //         context,
                  //         RouteUtil.createRoute(IdentityPage()),
                  //             (check) => false);
                  //   } else {
                  //     Navigator.pushAndRemoveUntil(
                  //         context,
                  //         RouteUtil.createRoute(BaseTabBar(
                  //             (resultMap["data"]["identity"] == 1 ||
                  //                 resultMap["data"]["identity"] == 2)
                  //                 ? true
                  //                 : true)),
                  //             (check) => false);
                  //   }
                  //   return;
                  // } else {
                  //   Fluttertoast.showToast(
                  //       msg: resultMap["msg"].toString(),
                  //       toastLength: Toast.LENGTH_SHORT,
                  //       gravity: ToastGravity.CENTER,
                  //       timeInSecForIosWeb: 1,
                  //       backgroundColor: Colors.black,
                  //       textColor: Colors.white,
                  //       fontSize: 6.5.sp);
                  //   return;
                  // }
                },
                child: Container(
                    width: 30.w,
                    height: 15.h,
                    child: Center(
                      child: Text("登录",
                          style: TextStyle(
                              fontSize: 8.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    )),
                color: Colors.orange,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          )
        ],
      ),
    ));
  }

  @override
  bool get wantKeepAlive => true;
}
