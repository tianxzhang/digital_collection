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
      backgroundColor: ColorsUtil.hexColor(0x1E201F),
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        child: Container(
          // decoration: BoxDecoration(color: Colors.grey),
          padding: EdgeInsets.only(
              top: MediaQueryData.fromWindow(window).padding.top + 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 24.w),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "assets/login_leftarrow.png",
                      width: 24.w,
                      height: 24.w,
                      fit: BoxFit.fill,
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.only(right: 24.w),
                  child: Container(
                    width: 84.w,
                    height: 32.h,
                    alignment: Alignment.center,
                    child: Text(
                      '',
                      style: TextStyle(color: ColorsUtil.hexColor(0xCFAE7F),fontSize: 16.sp),
                    ),
                  )),
            ],
          ),
        ),
        preferredSize: Size(MediaQueryData.fromWindow(window).size.width,
            MediaQueryData.fromWindow(window).padding.top + 17.h),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 27.w, top: 40.h),
                    // alignment: Alignment.center,
                    child: Text(
                      "重置密码",
                      style: TextStyle(
                          fontSize: 21.sp,
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
                      left: 25.w,
                      top: 45.h,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          child: Icon(Icons.person,color: ColorsUtil.hexColor(0xB5B5B5),),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5.w),
                          child: Text("账号",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: ColorsUtil.hexColor(0xB5B5B5))),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                        left: 25.w, right: 25.w, top: 12.h,),
                      padding: EdgeInsets.only(left: 25.w),
                      // width: 100.w,
                      // height: 16.h,
                      decoration: new BoxDecoration(
                          borderRadius:
                          BorderRadius.all(Radius.circular(25.w)),
                          // border: Border.all(
                          //   color: ColorsUtil.hexColor(0xF2F2F2),
                          //   width: 1.w,
                          //   style: BorderStyle.solid,
                          // ),
                          color: ColorsUtil.hexColor(0xffffff,alpha: 0.1)),
                      child: TextField(
                        controller: shoujihao,
                        cursorColor:
                        ColorsUtil.hexColor(0x9F9F9F),
                        //设置光标
                        decoration: InputDecoration(
//                        contentPadding: const EdgeInsets.symmetric(vertical: 9.8),
                            border: InputBorder.none,
                            hintText: "请输入手机号",
                            hintStyle: new TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.normal,
                                color: ColorsUtil.hexColor(
                                    0x7D7D7D))),
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
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal,
                            color: ColorsUtil.hexColor(
                                0x7D7D7D)),
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
                      )
                  )
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 25.w,
                      top: 21.h,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          child: Icon(Icons.shield,color: ColorsUtil.hexColor(0xB5B5B5),),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5.w),
                          child: Text("验证码",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: ColorsUtil.hexColor(0xB5B5B5))),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Container(
                              margin: EdgeInsets.only(
                                left: 25.w, right: 15.w, top: 12.h,),
                              padding: EdgeInsets.only(left: 25.w),
                              // width: 100.w,
                              // height: 16.h,
                              decoration: new BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(25.w)),
                                  // border: Border.all(
                                  //   color: ColorsUtil.hexColor(0xF2F2F2),
                                  //   width: 1.w,
                                  //   style: BorderStyle.solid,
                                  // ),
                                  color: ColorsUtil.hexColor(0xffffff,alpha: 0.1)),
                              child: TextField(
                                controller: yazhengma,
                                cursorColor:
                                ColorsUtil.hexColor(0x9F9F9F),
                                //设置光标
                                decoration: InputDecoration(
//                        contentPadding: const EdgeInsets.symmetric(vertical: 9.8),
                                    border: InputBorder.none,
                                    hintText: "请输入验证码",
                                    hintStyle: new TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.normal,
                                        color: ColorsUtil.hexColor(
                                            0x7D7D7D))),
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
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.normal,
                                    color: ColorsUtil.hexColor(
                                        0x7D7D7D)),
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
                              )
                          )
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
                                          height: 39.h,
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
                                                  "/u/registerCode",
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
                                width: 100.w,
                                height: 35.h,
                                margin: EdgeInsets.only(top: 10.h,right: 24.w),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    color: ColorsUtil.hexColor(0xAB7F3C)),
                                child: Text(
                                  model.isNotClicked
                                      ? '获取验证码' //未点击过的初始状态
                                      : model.isFinish
                                      ? '重新获取' //倒计时结束
                                      : model.currentTime.toString() +
                                      "秒后重发",
                                  //过程中
                                  style: TextStyle(
                                      color: ColorsUtil.hexColor(0x533708),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp),
                                ),
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
                        left: 25.w,
                        top: 21.h,
                      ),
                      child: Row(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                child: Icon(Icons.lock,color: ColorsUtil.hexColor(0xB5B5B5),),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5.w),
                                child: Text("设置密码",
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                        color: ColorsUtil.hexColor(0xB5B5B5))),
                              ),
                            ],
                          ),
                        ],
                      )
                  ),
                  Container(
                      margin: EdgeInsets.only(
                        left: 25.w, right: 25.w, top: 12.h,),
                      padding: EdgeInsets.only(left: 25.w,right: 18.w),
                      // width: 100.w,
                      // height: 16.h,
                      decoration: new BoxDecoration(
                          borderRadius:
                          BorderRadius.all(Radius.circular(25.w)),
                          // border: Border.all(
                          //   color: ColorsUtil.hexColor(0xF2F2F2),
                          //   width: 1.w,
                          //   style: BorderStyle.solid,
                          // ),
                          color: ColorsUtil.hexColor(0xffffff,alpha: 0.1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: TextField(
                            controller: mima,
                            cursorColor:
                            ColorsUtil.hexColor(0x9F9F9F),
                            //设置光标
                            decoration: InputDecoration(
//                        contentPadding: const EdgeInsets.symmetric(vertical: 9.8),
                                border: InputBorder.none,
                                hintText: "请输入密码",
                                hintStyle: new TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.normal,
                                    color: ColorsUtil.hexColor(
                                        0x7D7D7D))),
                            maxLines: 1,
                            // maxLength: 10,
                            //最大行数
                            autofocus: false,
                            //是否自动对焦
                            obscureText: !passwordVisible,
                            enabled: true,
                            //是否是密码
//                  textAlign: TextAlign.center,//文本对齐方式
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.normal,
                                color: ColorsUtil.hexColor(
                                    0x7D7D7D)),
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
                                margin: EdgeInsets.only(bottom: 0.h),
                                child: Image.asset(
                                  "assets/login_passeye.png",
                                  height: 25.w,
                                  fit: BoxFit.fitHeight,
                                  color: !passwordVisible
                                      ? Colors.grey
                                      : ColorsUtil.hexColor(0xffffff),
                                ),
                              )),
                        ],
                      )
                  )
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(
                        left: 25.w,
                        top: 21.h,
                      ),
                      child: Row(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                child: Icon(Icons.lock,color: ColorsUtil.hexColor(0xB5B5B5),),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5.w),
                                child: Text("设置密码",
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                        color: ColorsUtil.hexColor(0xB5B5B5))),
                              ),
                            ],
                          ),
                        ],
                      )
                  ),
                  Container(
                      margin: EdgeInsets.only(
                        left: 25.w, right: 25.w, top: 12.h,),
                      padding: EdgeInsets.only(left: 25.w,right: 18.w),
                      // width: 100.w,
                      // height: 16.h,
                      decoration: new BoxDecoration(
                          borderRadius:
                          BorderRadius.all(Radius.circular(25.w)),
                          // border: Border.all(
                          //   color: ColorsUtil.hexColor(0xF2F2F2),
                          //   width: 1.w,
                          //   style: BorderStyle.solid,
                          // ),
                          color: ColorsUtil.hexColor(0xffffff,alpha: 0.1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: TextField(
                            controller: remima,
                            cursorColor:
                            ColorsUtil.hexColor(0x9F9F9F),
                            //设置光标
                            decoration: InputDecoration(
//                        contentPadding: const EdgeInsets.symmetric(vertical: 9.8),
                                border: InputBorder.none,
                                hintText: "请输入密码",
                                hintStyle: new TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.normal,
                                    color: ColorsUtil.hexColor(
                                        0x7D7D7D))),
                            maxLines: 1,
                            // maxLength: 10,
                            //最大行数
                            autofocus: false,
                            //是否自动对焦
                            obscureText: !passwordVisible,
                            enabled: true,
                            //是否是密码
//                  textAlign: TextAlign.center,//文本对齐方式
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.normal,
                                color: ColorsUtil.hexColor(
                                    0x7D7D7D)),
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
                                margin: EdgeInsets.only(bottom: 0.h),
                                child: Image.asset(
                                  "assets/login_passeye.png",
                                  height: 25.w,
                                  fit: BoxFit.fitHeight,
                                  color: !passwordVisible
                                      ? Colors.grey
                                      : ColorsUtil.hexColor(0xffffff),
                                ),
                              )),
                        ],
                      )
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 25.w,
                      top: 13.h,
                    ),
                    child: Text("*限6-20个字符以内，建议使用数字字母组合，区分大小写",style: TextStyle(fontSize: 12.sp,color: ColorsUtil.hexColor(0x7D7D7D)),),
                  )
                ],
              ),

              Container(
//              margin: EdgeInsets.only(top: ScreenUtil().setWidth(50)),
                margin: EdgeInsets.only(
                    top: ScreenUtil().setWidth(42),
                    left: ScreenUtil().setWidth(25),
                    right: ScreenUtil().setWidth(25),
                    bottom: 15.h),

                width: ScreenUtil().setWidth(327),
                height: ScreenUtil().setHeight(49),
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
                      child: Center(
                        child: Text("重置密码",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      )),
                  color: ((shoujihao.text.length > 0) &&
                      (yazhengma.text.length > 0))
                      ? ColorsUtil.hexColor(0xB48C50)
                      : Colors.grey,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    // side: BorderSide(
                    //   color: Colors.white,
                    //   width: 1,
                    // ),
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
