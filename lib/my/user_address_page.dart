import 'package:digital_collection/util/color_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAddressPage extends StatefulWidget {
  @override
  UserAddressPageState createState() => UserAddressPageState();
}

class UserAddressPageState extends State<UserAddressPage>
    with AutomaticKeepAliveClientMixin {
  var province = new TextEditingController();
  var city = new TextEditingController();
  var district = new TextEditingController();
  var detailedAddress = new TextEditingController();
  var username = new TextEditingController();
  var phone = new TextEditingController();
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
    // if (prefs.getString("token") != null && prefs.getString("token") != "") {
    //   setState(() {
    //     isLogin = true;
    //   });
    // }
    // Map<String, String> postMap = Map<String, String>();
    // var result = await NetWorkUtil.getHttpQuery("/n/userInfo", postMap);
    // Map<String, dynamic> resultMap = json.decode(result.toString());
    // if (resultMap["code"] == 1) {
    //   userInfoEntity = UserInfoEntity.fromJson(resultMap);
    //   return;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(
              child: CupertinoActivityIndicator(),
            );
          case ConnectionState.done:
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
                                child: Text("收货地址",
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
                          margin: EdgeInsets.only(top: 15.h),
                          child: Center(
                            child: Column(
                              children: [
                                Container(
                                  // margin: EdgeInsets.only(top: 10.h, left: 14.5.w),
                                  // height: 20.h,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        child: Text("省份"),
                                      ),
                                      Container(
                                        // margin: EdgeInsets.only(left: 23.w),
                                          constraints: BoxConstraints(maxWidth: 50.w),
                                          height: 25.h,
                                          child: TextField(
                                            controller: province,
                                            keyboardType: TextInputType.text,
                                            cursorColor: Colors.black,
                                            //设置光标
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderSide:
                                                    BorderSide(color: Colors.transparent)),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                disabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                hintText: "",
                                                hintStyle: new TextStyle(
                                                  // fontSize: 14.sp,
                                                    fontWeight: FontWeight.normal,
                                                    color: ColorsUtil.hexColor(0xB7B7B7))),
                                            maxLines: 1,
                                            //最大行数
                                            autofocus: false,
                                            //是否自动对焦
                                            obscureText: false,
                                            //是否是密码
//                  textAlign: TextAlign.center,//文本对齐方式
                                            style: TextStyle(
                                              // fontSize: 18.sp,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black),
                                            //输入文本的样式
                                            onChanged: (text) {},
                                            onSubmitted: (text) {
                                              print('submit $text');
                                              // FocusScope.of(context).requestFocus(FocusNode());
                                            },
                                          ))
                                    ],
                                  ),
                                ),
                                Container(
                                  // margin: EdgeInsets.only(top: 10.h, left: 14.5.w),
                                  // height: 20.h,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        child: Text("城市"),
                                      ),
                                      Container(
                                        // margin: EdgeInsets.only(left: 23.w),
                                          constraints: BoxConstraints(maxWidth: 50.w),
                                          height: 25.h,
                                          child: TextField(
                                            controller: city,
                                            keyboardType: TextInputType.text,
                                            cursorColor: Colors.black,
                                            //设置光标
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderSide:
                                                    BorderSide(color: Colors.transparent)),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                disabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                hintText: "",
                                                hintStyle: new TextStyle(
                                                  // fontSize: 14.sp,
                                                    fontWeight: FontWeight.normal,
                                                    color: ColorsUtil.hexColor(0xB7B7B7))),
                                            maxLines: 1,
                                            //最大行数
                                            autofocus: false,
                                            //是否自动对焦
                                            obscureText: false,
                                            //是否是密码
//                  textAlign: TextAlign.center,//文本对齐方式
                                            style: TextStyle(
                                              // fontSize: 18.sp,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black),
                                            //输入文本的样式
                                            onChanged: (text) {},
                                            onSubmitted: (text) {
                                              print('submit $text');
                                              // FocusScope.of(context).requestFocus(FocusNode());
                                            },
                                          ))
                                    ],
                                  ),
                                ),
                                Container(
                                  // margin: EdgeInsets.only(top: 10.h, left: 14.5.w),
                                  // height: 20.h,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        child: Text("区/镇"),
                                      ),
                                      Container(
                                        // margin: EdgeInsets.only(left: 23.w),
                                          constraints: BoxConstraints(maxWidth: 50.w),
                                          height: 25.h,
                                          child: TextField(
                                            controller: district,
                                            keyboardType: TextInputType.text,
                                            cursorColor: Colors.black,
                                            //设置光标
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderSide:
                                                    BorderSide(color: Colors.transparent)),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                disabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                hintText: "",
                                                hintStyle: new TextStyle(
                                                  // fontSize: 14.sp,
                                                    fontWeight: FontWeight.normal,
                                                    color: ColorsUtil.hexColor(0xB7B7B7))),
                                            maxLines: 1,
                                            //最大行数
                                            autofocus: false,
                                            //是否自动对焦
                                            obscureText: false,
                                            //是否是密码
//                  textAlign: TextAlign.center,//文本对齐方式
                                            style: TextStyle(
                                              // fontSize: 18.sp,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black),
                                            //输入文本的样式
                                            onChanged: (text) {},
                                            onSubmitted: (text) {
                                              print('submit $text');
                                              // FocusScope.of(context).requestFocus(FocusNode());
                                            },
                                          ))
                                    ],
                                  ),
                                ),
                                Container(
                                  // margin: EdgeInsets.only(top: 10.h, left: 14.5.w),
                                  // height: 20.h,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        child: Text("详细地址"),
                                      ),
                                      Container(
                                        // margin: EdgeInsets.only(left: 23.w),
                                          constraints: BoxConstraints(maxWidth: 50.w),
                                          height: 25.h,
                                          child: TextField(
                                            controller: detailedAddress,
                                            keyboardType: TextInputType.text,
                                            cursorColor: Colors.black,
                                            //设置光标
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderSide:
                                                    BorderSide(color: Colors.transparent)),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                disabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                hintText: "",
                                                hintStyle: new TextStyle(
                                                  // fontSize: 14.sp,
                                                    fontWeight: FontWeight.normal,
                                                    color: ColorsUtil.hexColor(0xB7B7B7))),
                                            maxLines: 1,
                                            //最大行数
                                            autofocus: false,
                                            //是否自动对焦
                                            obscureText: false,
                                            //是否是密码
//                  textAlign: TextAlign.center,//文本对齐方式
                                            style: TextStyle(
                                              // fontSize: 18.sp,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black),
                                            //输入文本的样式
                                            onChanged: (text) {},
                                            onSubmitted: (text) {
                                              print('submit $text');
                                              // FocusScope.of(context).requestFocus(FocusNode());
                                            },
                                          ))
                                    ],
                                  ),
                                ),
                                Container(
                                  // margin: EdgeInsets.only(top: 10.h, left: 14.5.w),
                                  // height: 20.h,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        child: Text("收货人姓名"),
                                      ),
                                      Container(
                                        // margin: EdgeInsets.only(left: 23.w),
                                          constraints: BoxConstraints(maxWidth: 50.w),
                                          height: 25.h,
                                          child: TextField(
                                            controller: username,
                                            keyboardType: TextInputType.text,
                                            cursorColor: Colors.black,
                                            //设置光标
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderSide:
                                                    BorderSide(color: Colors.transparent)),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                disabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                hintText: "",
                                                hintStyle: new TextStyle(
                                                  // fontSize: 14.sp,
                                                    fontWeight: FontWeight.normal,
                                                    color: ColorsUtil.hexColor(0xB7B7B7))),
                                            maxLines: 1,
                                            //最大行数
                                            autofocus: false,
                                            //是否自动对焦
                                            obscureText: false,
                                            //是否是密码
//                  textAlign: TextAlign.center,//文本对齐方式
                                            style: TextStyle(
                                              // fontSize: 18.sp,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black),
                                            //输入文本的样式
                                            onChanged: (text) {},
                                            onSubmitted: (text) {
                                              print('submit $text');
                                              // FocusScope.of(context).requestFocus(FocusNode());
                                            },
                                          ))
                                    ],
                                  ),
                                ),
                                Container(
                                  // margin: EdgeInsets.only(top: 10.h, left: 14.5.w),
                                  // height: 20.h,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        child: Text("手机号"),
                                      ),
                                      Container(
                                        // margin: EdgeInsets.only(left: 23.w),
                                          constraints: BoxConstraints(maxWidth: 50.w),
                                          height: 25.h,
                                          child: TextField(
                                            controller: phone,
                                            keyboardType: TextInputType.text,
                                            cursorColor: Colors.black,
                                            //设置光标
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderSide:
                                                    BorderSide(color: Colors.transparent)),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                disabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                hintText: "",
                                                hintStyle: new TextStyle(
                                                  // fontSize: 14.sp,
                                                    fontWeight: FontWeight.normal,
                                                    color: ColorsUtil.hexColor(0xB7B7B7))),
                                            maxLines: 1,
                                            //最大行数
                                            autofocus: false,
                                            //是否自动对焦
                                            obscureText: false,
                                            //是否是密码
//                  textAlign: TextAlign.center,//文本对齐方式
                                            style: TextStyle(
                                              // fontSize: 18.sp,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black),
                                            //输入文本的样式
                                            onChanged: (text) {},
                                            onSubmitted: (text) {
                                              print('submit $text');
                                              // FocusScope.of(context).requestFocus(FocusNode());
                                            },
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      child: Container(
                        margin: EdgeInsets.only(left: 8.w, right: 8.w,top: 30.h),
                        width: 171.5.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.w),
                            color: Colors.grey
                        ),
                        child: Center(
                          child: Text(
                            "保存",
                            style: TextStyle(
                                color: Colors.deepOrange,
                                fontSize: 8.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      onTap: () {

                      },
                    ),
                  ],
                ),
              ),
            );
        }
      },
      future: resultData,
    );


  }
}
