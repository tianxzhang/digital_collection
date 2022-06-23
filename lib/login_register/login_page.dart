import 'dart:ui';

import 'package:digital_collection/base/config_util.dart';
import 'package:digital_collection/base/webview_page.dart';
import 'package:digital_collection/login_register/register_page.dart';
import 'package:digital_collection/util/color_util.dart';
import 'package:digital_collection/util/common_util.dart';
import 'package:digital_collection/util/route_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'forget_password_page.dart';

class LoginPage extends StatefulWidget {
  final bool exit;

  LoginPage(this.exit);

  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage>
    with AutomaticKeepAliveClientMixin {
  var shoujihao = new TextEditingController();
  var yazhengma = new TextEditingController();
  bool passwordVisible = false;
  bool xieyi = true;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        child: Container(
          decoration: BoxDecoration(color: Colors.grey),
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
              Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context, RouteUtil.createRoute(RegisterPage()));
                    },
                    child: Container(
                      width: 30.w,
                      height: 10.h,
                      alignment: Alignment.center,
                      child: Text(
                        '注册',
                        style: TextStyle(color: Colors.amberAccent),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.amberAccent),
                        borderRadius: BorderRadius.circular(21),
                      ),
                    ),
                  )),
            ],
          ),
        ),
        preferredSize: Size(MediaQueryData.fromWindow(window).size.width,
            MediaQueryData.fromWindow(window).padding.top + 17.h),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // width: 70.w,
                  height: 14.h,
                  margin: EdgeInsets.only(left: 16.5.w, top: 25.h),
                  // alignment: Alignment.center,
                  child: Text(
                    "欢迎登录 玄梦阁数藏",
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorsUtil.hexColor(0x333333)),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 18.w, right: 19.w,top: 18.h,),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            child: Icon(Icons.person),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 6.h),
                            child: Text("手机号",
                                style: TextStyle(
                                    fontSize: 8.5.sp,
                                    fontWeight: FontWeight.bold,
                                    color: ColorsUtil.hexColor(0x333333))),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                                left: 8.w, right: 8.w, top: 5.h, bottom: 7.5.h),
                            // width: 100.w,
                            // height: 16.h,
                            decoration: new BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10.w)),
                                border: Border.all(
                                  color: ColorsUtil.hexColor(0xF2F2F2),
                                  width: 1.w,
                                  style: BorderStyle.solid,
                                ),
                                color: ColorsUtil.hexColor(0xF2F2F2)),
                            child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      // margin: EdgeInsets.only(left: 5.w, top: 5.h),
                                        height: 16.h,
                                        width: 72.w,
                                        child: TextField(
                                          // controller: khxm,
                                          cursorColor:
                                          ColorsUtil.hexColor(0x9F9F9F),
                                          //设置光标
                                          decoration: InputDecoration(
//                        contentPadding: const EdgeInsets.symmetric(vertical: 9.8),
                                              border: InputBorder.none,
                                              hintText: "请输入手机号",
                                              hintStyle: new TextStyle(
                                                  fontSize: 6.sp,
                                                  fontWeight: FontWeight.normal,
                                                  color: ColorsUtil.hexColor(
                                                      0x9F9F9F))),
                                          maxLines: 1,
                                          // maxLength: 10,
                                          //最大行数
                                          autofocus: false,
                                          //是否自动对焦
                                          obscureText: false,
                                          enabled: true,
                                          //是否是密码
//                  textAlign: TextAlign.center,//文本对齐方式
                                          style: TextStyle(
                                              fontSize: 6.sp,
                                              fontWeight: FontWeight.normal,
                                              color: ColorsUtil.hexColor(0x2F2F2F)),
                                          //输入文本的样式
                                          onChanged: (text) {
                                            print('change $text' +
                                                text.length.toString());
                                          },
                                          onSubmitted: (text) {
                                            print('submit $text');
                                            FocusScope.of(context)
                                                .requestFocus(FocusNode());
                                          },
                                        ))
                                  ],
                                )),
                          ),
                        ),
                                              ],
                    ),

                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 18.w, right: 19.w),
                  height: 23.h,
                  decoration: new BoxDecoration(
                      color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            child: Icon(Icons.lock),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5.h, bottom: 6.5.h),
                            child: Row(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Text("密    码",
                                                style: TextStyle(
                                                    fontSize: 8.5.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: ColorsUtil.hexColor(
                                                        0x333333))),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      Container(
                          margin: EdgeInsets.only(bottom: 10.h),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context, RouteUtil.createRoute(ForgetPasswordPage()));
                            },
                            child: Text("忘记密码？",
                                style: TextStyle(
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.bold,
                                    color: ColorsUtil.hexColor(0xFD3D46))),
                          )),

                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 8.w, right: 8.w, top: 5.h, bottom: 7.5.h),
                        // width: 100.w,
                        // height: 16.h,
                        decoration: new BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10.w)),
                            border: Border.all(
                              color: ColorsUtil.hexColor(0xF2F2F2),
                              width: 1.w,
                              style: BorderStyle.solid,
                            ),
                            color: ColorsUtil.hexColor(0xF2F2F2)),
                        child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  // margin: EdgeInsets.only(left: 5.w, top: 5.h),
                                    height: 16.h,
                                    width: 72.w,
                                    child: TextField(
                                      // controller: khxm,
                                      cursorColor:
                                      ColorsUtil.hexColor(0x9F9F9F),
                                      //设置光标
                                      decoration: InputDecoration(
//                        contentPadding: const EdgeInsets.symmetric(vertical: 9.8),
                                          border: InputBorder.none,
                                          hintText: "请输入手机号",
                                          hintStyle: new TextStyle(
                                              fontSize: 6.sp,
                                              fontWeight: FontWeight.normal,
                                              color: ColorsUtil.hexColor(
                                                  0x9F9F9F))),
                                      maxLines: 1,
                                      // maxLength: 10,
                                      //最大行数
                                      autofocus: false,
                                      //是否自动对焦
                                      obscureText: false,
                                      enabled: true,
                                      //是否是密码
//                  textAlign: TextAlign.center,//文本对齐方式
                                      style: TextStyle(
                                          fontSize: 6.sp,
                                          fontWeight: FontWeight.normal,
                                          color: ColorsUtil.hexColor(0x2F2F2F)),
                                      //输入文本的样式
                                      onChanged: (text) {
                                        print('change $text' +
                                            text.length.toString());
                                      },
                                      onSubmitted: (text) {
                                        print('submit $text');
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                      },
                                    )),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        passwordVisible = !passwordVisible;
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 6.h),
                                      child: Image.asset(
                                        "assets/login_passeye.png",
                                        width: 9.w,
                                        height: 6.59.h,
                                        fit: BoxFit.fill,
                                        color: !passwordVisible
                                            ? Colors.grey
                                            : ColorsUtil.hexColor(0xFD4049),
                                      ),
                                    )),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 18.w, right: 14.5.w, top: 5.h),
                  height: 30.h,
                  decoration: new BoxDecoration(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 10.h),
                        child: InkWell(
                          onTap: () {},
                          child: Text("",
                              style: TextStyle(
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.bold,
                                  color: ColorsUtil.hexColor(0xFD3D46))),
                        ),
                      ),

                    ],
                  ),
                ),
                Container(
//              margin: EdgeInsets.only(top: ScreenUtil().setWidth(50)),
                  margin: EdgeInsets.only(
                      top: ScreenUtil().setWidth(0),
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
                                  color: Colors.white)),
                        )),
                    color: ((shoujihao.text.length > 0) &&
                            (yazhengma.text.length > 0))
                        ? Colors.grey
                        : Colors.grey,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  // margin: EdgeInsets.only(top: 30.h),
                  width: ScreenUtil().screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          margin: EdgeInsets.only(right: 3.w, bottom: 25.h),
                          // padding: EdgeInsets.only(top: ScreenUtil().setWidth(12)),
                          width: 6.5.w,
                          height: 6.5.h,
                          child: !xieyi
                              ? Image.asset(
                            "assets/login_xieyi.png",
                            // width: 24.w,
                            // height: 24.w,
                            fit: BoxFit.fill,
                          )
                              : Image.asset(
                            "assets/login_xieyi_ok.png",
                            // width: 24.w,
                            // height: 24.w,
                            fit: BoxFit.fill,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            xieyi = !xieyi;
                          });
                        },
                      ),
                      Container(
//              padding: EdgeInsets.only(top: ScreenUtil().setWidth(50)),
                        margin: EdgeInsets.only(top: 0.h, bottom: 25.h),

                        child: RichText(
                          text: TextSpan(
                            text: '点击登录则代表您已经同意',
                            style: TextStyle(
                                color: ColorsUtil.hexColor(0x9F9F9F),
                                fontSize: 6.sp),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' 用户协议 ',
                                  style: TextStyle(
                                      color: ColorsUtil.hexColor(0x4A8BF9),
                                      fontSize: 6.sp),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => WebViewPage(
                                                urlPath:
                                                ConfigUtil.baseUrl+"appApi/about",
                                                title: "用户协议",
                                              )));
                                    }),
                              TextSpan(
                                text: '和',
                                style: TextStyle(
                                    color: ColorsUtil.hexColor(0x9F9F9F),
                                    fontSize: 6.sp),
                              ),
                              TextSpan(
                                  text: ' 隐私政策',
                                  style: TextStyle(
                                      color: ColorsUtil.hexColor(0x4A8BF9),
                                      fontSize: 6.sp),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => WebViewPage(
                                                  urlPath:ConfigUtil.baseUrl+"appApi/privacy",
                                                  title: "隐私政策")));
                                    }),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Container(
                //       margin: EdgeInsets.only(bottom: 11.h),
                //       width: 100.w,
                //       decoration: BoxDecoration(
                //           image: DecorationImage(
                //             image: AssetImage("assets/login_hengxian.png"),
                //           )),
                //       child: Center(
                //         child: Text("其他登录方式",
                //             style: TextStyle(
                //                 fontSize: 7.5.sp,
                //                 fontWeight: FontWeight.bold,
                //                 color: ColorsUtil.hexColor(0x999999))),
                //       ),
                //     ),
                //   ],
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Container(
                //         width: 21.w,
                //         height: 21.h,
                //         margin: EdgeInsets.only(bottom: 25.5.h),
                //         decoration: new BoxDecoration(),
                //         child: Image.asset("assets/login_wechat.png")),
                //   ],
                // ),
                Container(
                  alignment: Alignment.bottomCenter,
                  // margin: EdgeInsets.only(top: 30.h),
                  width: ScreenUtil().screenWidth,
                  height: 50.h,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/login_beijing.png"),
                          fit: BoxFit.fill)),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     InkWell(
//                       child: Container(
//                         margin: EdgeInsets.only(right: 3.w, bottom: 25.h),
//                         // padding: EdgeInsets.only(top: ScreenUtil().setWidth(12)),
//                         width: 6.5.w,
//                         height: 6.5.h,
//                         child: !xieyi
//                             ? Image.asset(
//                                 "assets/login_xieyi.png",
//                                 // width: 24.w,
//                                 // height: 24.w,
//                                 fit: BoxFit.fill,
//                               )
//                             : Image.asset(
//                                 "assets/login_xieyi_ok.png",
//                                 // width: 24.w,
//                                 // height: 24.w,
//                                 fit: BoxFit.fill,
//                               ),
//                       ),
//                       onTap: () {
//                         setState(() {
//                           xieyi = !xieyi;
//                         });
//                       },
//                     ),
//                     Container(
// //              padding: EdgeInsets.only(top: ScreenUtil().setWidth(50)),
//                       margin: EdgeInsets.only(top: 0.h, bottom: 25.h),
//
//                       child: RichText(
//                         text: TextSpan(
//                           text: '点击登录则代表您已经同意',
//                           style: TextStyle(
//                               color: ColorsUtil.hexColor(0x9F9F9F),
//                               fontSize: 6.sp),
//                           children: <TextSpan>[
//                             TextSpan(
//                                 text: ' 用户协议 ',
//                                 style: TextStyle(
//                                     color: ColorsUtil.hexColor(0x4A8BF9),
//                                     fontSize: 6.sp),
//                                 recognizer: TapGestureRecognizer()
//                                   ..onTap = () async {
//                                     Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) => WebViewPage(
//                                                   urlPath:
//                                                       "http://www.wzbl.net/letter/dp/202010/74842.html",
//                                                   title: "用户协议",
//                                                 )));
//                                   }),
//                             TextSpan(
//                               text: '和',
//                               style: TextStyle(
//                                   color: ColorsUtil.hexColor(0x9F9F9F),
//                                   fontSize: 6.sp),
//                             ),
//                             TextSpan(
//                                 text: ' 隐私政策',
//                                 style: TextStyle(
//                                     color: ColorsUtil.hexColor(0x4A8BF9),
//                                     fontSize: 6.sp),
//                                 recognizer: TapGestureRecognizer()
//                                   ..onTap = () async {
//                                     Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) => WebViewPage(
//                                                 urlPath:
//                                                     "http://www.wzbl.net/letter/dp/202010/74842.html",
//                                                 title: "隐私政策")));
//                                   }),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
