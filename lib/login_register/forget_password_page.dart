import 'dart:convert';
import 'dart:ui';
import 'package:digital_collection/base/consume_widget.dart';
import 'package:digital_collection/base/countdown_time_model.dart';
import 'package:digital_collection/login_register/login_page.dart';
import 'package:digital_collection/util/color_util.dart';
import 'package:digital_collection/util/common_util.dart';
import 'package:digital_collection/util/network_util.dart';
import 'package:digital_collection/util/route_util.dart';
import 'package:flutter_aliyun_captcha/flutter_aliyun_captcha.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class ForgetPasswordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ForgetPasswordPageState();
  }
}

class ForgetPasswordPageState extends State<ForgetPasswordPage>
    with AutomaticKeepAliveClientMixin {
  var shoujihao = new TextEditingController();
  var yazhengma = new TextEditingController();
  var mima = new TextEditingController();
  var remima = new TextEditingController();
  bool passwordVisible = false;
  AliyunCaptchaController _captchaController = AliyunCaptchaController();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              Padding(
                padding: EdgeInsets.only(right: 8.w),
              ),
            ],
          ),
        ),
        preferredSize: Size(
          MediaQueryData.fromWindow(window).size.width,
          MediaQueryData.fromWindow(window).padding.top + 17.h,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: Colors.black38),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // width: 90.w,
                    // height: 14.h,
                    margin: EdgeInsets.only(left: 16.5.w, top: 25.h),
                    // alignment: Alignment.center,
                    child: Text(
                      "重置密码",
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorsUtil.hexColor(0xffffff)),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 18.w,
                      right: 19.w,
                      top: 18.h,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          child: Icon(Icons.person),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 0.h),
                          child: Text("账号",
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
                                    controller: shoujihao,
                                    cursorColor: ColorsUtil.hexColor(0x9F9F9F),
                                    //设置光标
                                    decoration: InputDecoration(
//                        contentPadding: const EdgeInsets.symmetric(vertical: 9.8),
                                        border: InputBorder.none,
                                        hintText: "请输入手机号",
                                        hintStyle: new TextStyle(
                                            fontSize: 6.sp,
                                            fontWeight: FontWeight.normal,
                                            color:
                                                ColorsUtil.hexColor(0x9F9F9F))),
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
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 18.w,
                      right: 19.w,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          child: Icon(Icons.cloud),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 0.h),
                          child: Text("验证码",
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
                                    controller: yazhengma,
                                    cursorColor: ColorsUtil.hexColor(0x9F9F9F),
                                    //设置光标
                                    decoration: InputDecoration(
//                        contentPadding: const EdgeInsets.symmetric(vertical: 9.8),
                                        border: InputBorder.none,
                                        hintText: "请输入验证码",
                                        hintStyle: new TextStyle(
                                            fontSize: 6.sp,
                                            fontWeight: FontWeight.normal,
                                            color:
                                                ColorsUtil.hexColor(0x9F9F9F))),
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
                      GestureDetector(
                        onTap: () {
                          Toast.show("已发送");
                        },
                        child: ConsumeComponent<CountDownTimeModel>(
                          model: CountDownTimeModel(60, 1),
                          builder: (context, model, _) => InkWell(
                              onTap: model.isFinish
                                  ? () async {
                                      var phone = CommonUtil.noBlank(
                                          shoujihao.text.toString());
                                      print("phone==" + phone);
                                      if (!CommonUtil.isChinaPhoneLegal(
                                          phone)) {
                                        Toast.show("手机号输入有误");
                                        return;
                                      }
                                      showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  content: Container(
                                                    width: double.infinity,
                                                    height: 20.h,
                                                    child: AliyunCaptchaButton(
                                                      controller:
                                                          _captchaController,
                                                      type: AliyunCaptchaType
                                                          .slide,
                                                      option:
                                                          AliyunCaptchaOption(
                                                        appKey:
                                                            'FFFF0N0000000000A9AB',
                                                        scene: 'nc_message_h5',
                                                        language: 'cn',
                                                      ),
                                                      customStyle: '''
                                                        .nc_scale {
                                                          background: #eeeeee !important;
                                                          /* 默认背景色 */
                                                        }
                                                      ''',
                                                      onSuccess:
                                                          (dynamic data) async {
                                                            model.startCountDown();
                                                            Map<String, String>
                                                            postMap = new Map<
                                                                String,
                                                                String>();
                                                            postMap['phone'] =
                                                                phone;
                                                            postMap['scene'] =
                                                            '111';
                                                            postMap['sessionId'] =
                                                            data['sessionId'];
                                                            postMap['sig'] =
                                                            data['sig'];
                                                            postMap['token'] =
                                                            data['token'];
                                                            Navigator.of(context)
                                                                .pop();
                                                            var result =
                                                                await NetWorkUtil
                                                                .getHttpQuery(
                                                                "/u/forgetPWCode",
                                                                postMap);
                                                            Map resultMap =
                                                            json.decode(result
                                                                .toString());

                                                      },
                                                      onFailure:
                                                          (String failCode) {},
                                                      onError:
                                                          (String errorCode) {},
                                                    ),
                                                  ),
                                                );
                                              },
                                              barrierDismissible: true)
                                          .then((value) {});
                                      return;
                                    }
                                  : null,
                              child: Container(
                                margin: EdgeInsets.only(bottom: 6.h),
                                child: Text(
                                  model.isNotClicked
                                      ? '获取验证码' //未点击过的初始状态
                                      : model.isFinish
                                          ? '重新获取' //倒计时结束
                                          : model.currentTime.toString() +
                                              "秒后重发",
                                  //过程中
                                  style: TextStyle(
                                      color: ColorsUtil.hexColor(0xFD3C45),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 7.5.sp),
                                ),
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
                          child: Text("设置密码",
                              style: TextStyle(
                                  fontSize: 8.5.sp,
                                  fontWeight: FontWeight.bold,
                                  color: ColorsUtil.hexColor(0x333333))),
                        ),
                      ],
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
                          borderRadius: BorderRadius.all(Radius.circular(10.w)),
                          border: Border.all(
                            color: ColorsUtil.hexColor(0xF2F2F2),
                            width: 1.w,
                            style: BorderStyle.solid,
                          ),
                          color: ColorsUtil.hexColor(0xF2F2F2)),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              // margin: EdgeInsets.only(left: 5.w, top: 5.h),
                              height: 16.h,
                              width: 72.w,
                              child: TextField(
                                controller: mima,
                                cursorColor: ColorsUtil.hexColor(0x9F9F9F),
                                //设置光标
                                decoration: InputDecoration(
//                        contentPadding: const EdgeInsets.symmetric(vertical: 9.8),
                                    border: InputBorder.none,
                                    hintText: "请输入密码",
                                    hintStyle: new TextStyle(
                                        fontSize: 6.sp,
                                        fontWeight: FontWeight.normal,
                                        color: ColorsUtil.hexColor(0x9F9F9F))),
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
                                  print(
                                      'change $text' + text.length.toString());
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
                margin: EdgeInsets.only(left: 18.w, right: 19.w),
                height: 23.h,
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
                          child: Text("确认密码",
                              style: TextStyle(
                                  fontSize: 8.5.sp,
                                  fontWeight: FontWeight.bold,
                                  color: ColorsUtil.hexColor(0x333333))),
                        ),
                      ],
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
                          borderRadius: BorderRadius.all(Radius.circular(10.w)),
                          border: Border.all(
                            color: ColorsUtil.hexColor(0xF2F2F2),
                            width: 1.w,
                            style: BorderStyle.solid,
                          ),
                          color: ColorsUtil.hexColor(0xF2F2F2)),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              // margin: EdgeInsets.only(left: 5.w, top: 5.h),
                              height: 16.h,
                              width: 72.w,
                              child: TextField(
                                controller: remima,
                                cursorColor: ColorsUtil.hexColor(0x9F9F9F),
                                //设置光标
                                decoration: InputDecoration(
//                        contentPadding: const EdgeInsets.symmetric(vertical: 9.8),
                                    border: InputBorder.none,
                                    hintText: "请再次输入密码",
                                    hintStyle: new TextStyle(
                                        fontSize: 6.sp,
                                        fontWeight: FontWeight.normal,
                                        color: ColorsUtil.hexColor(0x9F9F9F))),
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
                                  print(
                                      'change $text' + text.length.toString());
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
                    var phone = CommonUtil.noBlank(shoujihao.text.toString());
                    if (phone == null || phone.length == 0) {
                      Toast.show("请输入手机号");
                      return;
                    }
                    if (!CommonUtil.isChinaPhoneLegal(phone)) {
                      Toast.show("手机号输入有误");
                      return;
                    }
                    if (yazhengma.text.toString() == null ||
                        yazhengma.text.length < 4) {
                      Toast.show("验证码输入有误");
                      return;
                    }
                    if (mima.text.toString() == null ||
                        mima.text.length < 8) {
                      Toast.show("密码格式有误，不少于8位");
                      return;
                    }
                    if (mima.text.toString() != remima.text.toString()) {
                      Toast.show("两次输入的密码不一致");
                      return;
                    }
                    Map<String, dynamic> postMap = new Map<String, dynamic>();
                    postMap['phone'] =
                        CommonUtil.noBlank(shoujihao.text.toString());
                    postMap['code'] = yazhengma.text.toString();
                    postMap['NewPassword'] = mima.text.toString();

                    var result =
                    await NetWorkUtil.postHttp("/u/forgetPW", postMap);
                    Map resultMap = json.decode(result.toString());
                    if (resultMap["code"] == 1) {
                      Toast.show(resultMap["message"].toString());
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      await prefs.setString("token", "");
                      Navigator.pushAndRemoveUntil(
                          this.context,
                          RouteUtil.createRoute(LoginPage(false)),
                              (check) => false);
                      return;
                    } else {
                      Toast.show(resultMap["message"].toString());
                      return;
                    }
                  },
                  child: Container(
                      height: 15.h,
                      child: Center(
                        child: Text("重置密码",
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
            ],
          ),
        ),
      ),
    );
  }
}
