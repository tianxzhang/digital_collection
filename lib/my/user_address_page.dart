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
              backgroundColor: ColorsUtil.hexColor(0x1E201F),
              body: SafeArea(
                child: Container(
                  padding: EdgeInsets.all(15.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
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
                                  child: Text("????????????",
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
                          Container(
                            margin: EdgeInsets.only(top: 15.h),
                            decoration: BoxDecoration(color: ColorsUtil.hexColor(0x343635),borderRadius: BorderRadius.circular(20)),
                            padding: EdgeInsets.all(12.w),
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
                                          child: Text("??????",style: TextStyle(
                                              color:
                                              ColorsUtil.hexColor(0xffffff),
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold
                                          ),),
                                        ),
                                        Container(
                                            constraints: BoxConstraints(maxWidth: 180.w),
                                            // height: 25.h,
                                            child: TextField(
                                              textAlign: TextAlign.end,
                                              controller: province,
                                              keyboardType: TextInputType.text,
                                              cursorColor: ColorsUtil.hexColor(0xB5B5B5),
                                              //????????????
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
                                                  hintText: "???????????????",
                                                  hintStyle: new TextStyle(
                                                    fontSize: 16.sp,
                                                      fontWeight: FontWeight.normal,
                                                      color: ColorsUtil.hexColor(0xB5B5B5)),),
                                              maxLines: 1,
                                              //????????????
                                              autofocus: false,
                                              //??????????????????
                                              obscureText: false,
                                              //???????????????
//                  textAlign: TextAlign.center,//??????????????????
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.normal,
                                                  color: ColorsUtil.hexColor(0xB5B5B5)),
                                              //?????????????????????
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
                                          child: Text("??????",style: TextStyle(
                                              color:
                                              ColorsUtil.hexColor(0xffffff),
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold
                                          )),
                                        ),
                                        Container(
                                            constraints: BoxConstraints(maxWidth: 180.w),
                                            child: TextField(
                                              textAlign: TextAlign.end,
                                              controller: city,
                                              keyboardType: TextInputType.text,
                                              cursorColor: ColorsUtil.hexColor(0xB5B5B5),
                                              //????????????
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
                                                  hintText: "???????????????",
                                                  hintStyle: new TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight: FontWeight.normal,
                                                      color: ColorsUtil.hexColor(0xB5B5B5))),
                                              maxLines: 1,
                                              //????????????
                                              autofocus: false,
                                              //??????????????????
                                              obscureText: false,
                                              //???????????????
//                  textAlign: TextAlign.center,//??????????????????
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.normal,
                                                  color: ColorsUtil.hexColor(0xB5B5B5)),
                                              //?????????????????????
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
                                          child: Text("???/???",style: TextStyle(
                                              color:
                                              ColorsUtil.hexColor(0xffffff),
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold
                                          )),
                                        ),
                                        Container(
                                          // margin: EdgeInsets.only(left: 23.w),
                                            constraints: BoxConstraints(maxWidth: 180.w),
                                            child: TextField(
                                              controller: district,
                                              textAlign: TextAlign.end,
                                              keyboardType: TextInputType.text,
                                              cursorColor: ColorsUtil.hexColor(0xB5B5B5),
                                              //????????????
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
                                                  hintText: "????????????/???",
                                                  hintStyle: new TextStyle(
                                                    fontSize: 16.sp,
                                                      fontWeight: FontWeight.normal,
                                                      color: ColorsUtil.hexColor(0xB5B5B5))),
                                              maxLines: 1,
                                              //????????????
                                              autofocus: false,
                                              //??????????????????
                                              obscureText: false,
                                              //???????????????
//                  textAlign: TextAlign.center,//??????????????????
                                              style: TextStyle(
                                                fontSize: 16.sp,
                                                  fontWeight: FontWeight.normal,
                                                  color: ColorsUtil.hexColor(0xB5B5B5)),
                                              //?????????????????????
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
                                          child: Text("????????????",style: TextStyle(
                                              color:
                                              ColorsUtil.hexColor(0xffffff),
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold
                                          )),
                                        ),
                                        Container(
                                          // margin: EdgeInsets.only(left: 23.w),
                                            constraints: BoxConstraints(maxWidth: 180.w),
                                            child: TextField(
                                              textAlign: TextAlign.end,
                                              controller: detailedAddress,
                                              keyboardType: TextInputType.text,
                                              cursorColor: ColorsUtil.hexColor(0xB5B5B5),
                                              //????????????
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
                                                  hintText: "?????????????????????",
                                                  hintStyle: new TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight: FontWeight.normal,
                                                      color: ColorsUtil.hexColor(0xB5B5B5))),
                                              maxLines: 1,
                                              //????????????
                                              autofocus: false,
                                              //??????????????????
                                              obscureText: false,
                                              //???????????????
//                  textAlign: TextAlign.center,//??????????????????
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.normal,
                                                  color: ColorsUtil.hexColor(0xB5B5B5)),
                                              //?????????????????????
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
                                          child: Text("???????????????",style: TextStyle(
                                              color:
                                              ColorsUtil.hexColor(0xffffff),
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold
                                          )),
                                        ),
                                        Container(
                                          // margin: EdgeInsets.only(left: 23.w),
                                            constraints: BoxConstraints(maxWidth: 180.w),
                                            // height: 25.h,
                                            child: TextField(
                                              textAlign: TextAlign.end,
                                              controller: username,
                                              keyboardType: TextInputType.text,
                                              cursorColor: ColorsUtil.hexColor(0xB5B5B5),
                                              //????????????
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
                                                  hintText: "????????????????????????",
                                                  hintStyle: new TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight: FontWeight.normal,
                                                      color: ColorsUtil.hexColor(0xB5B5B5))),
                                              maxLines: 1,
                                              //????????????
                                              autofocus: false,
                                              //??????????????????
                                              obscureText: false,
                                              //???????????????
//                  textAlign: TextAlign.center,//??????????????????
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.normal,
                                                  color: ColorsUtil.hexColor(0xB5B5B5)),
                                              //?????????????????????
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
                                          child: Text("?????????",style: TextStyle(
                                              color:
                                              ColorsUtil.hexColor(0xffffff),
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold
                                          )),
                                        ),
                                        Container(
                                          // margin: EdgeInsets.only(left: 23.w),
                                            constraints: BoxConstraints(maxWidth: 180.w),
                                            // height: 25.h,
                                            child: TextField(textAlign: TextAlign.end,
                                              controller: phone,
                                              keyboardType: TextInputType.text,
                                              cursorColor: ColorsUtil.hexColor(0xB5B5B5),
                                              //????????????
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
                                                  hintText: "?????????????????????",
                                                  hintStyle: new TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight: FontWeight.normal,
                                                      color: ColorsUtil.hexColor(0xB5B5B5))),
                                              maxLines: 1,
                                              //????????????
                                              autofocus: false,
                                              //??????????????????
                                              obscureText: false,
                                              //???????????????
//                  textAlign: TextAlign.center,//??????????????????
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.normal,
                                                  color: ColorsUtil.hexColor(0xB5B5B5)),
                                              //?????????????????????
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
                          margin: EdgeInsets.only(bottom: 30.h),
                          width: 1.sw-30,
                          height: 50.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: ColorsUtil.hexColor(0xF7BD50)
                          ),
                          child: Center(
                            child: Text(
                              "??????",
                              style: TextStyle(
                                  color: ColorsUtil.hexColor(0x1A0F00),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        onTap: () {

                        },
                      ),
                    ],
                  ),
                )
              ),
            );
        }
      },
      future: resultData,
    );


  }
}
