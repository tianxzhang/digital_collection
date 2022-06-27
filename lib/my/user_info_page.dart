import 'package:cached_network_image/cached_network_image.dart';
import 'package:digital_collection/my/user_address_page.dart';
import 'package:digital_collection/util/color_util.dart';
import 'package:digital_collection/util/route_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'block_address_page.dart';
import 'model/user_info_entity.dart';

class UserInfoPage extends StatefulWidget {
  final UserInfoData userInfoData;

  UserInfoPage(this.userInfoData);

  @override
  UserInfoPageState createState() => UserInfoPageState();
}

class UserInfoPageState extends State<UserInfoPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtil.hexColor(0x1E201F),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15.w),
          child: Column(
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
              ),
  Container(
                  margin: EdgeInsets.only(top: 15.h),
    padding: EdgeInsets.all(13.w),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: ColorsUtil.hexColor(0x343635)),
    child: Column(
      mainAxisSize: MainAxisSize.min,
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
                    child: Image.asset("assets/8.png"),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 9.w),
                    child: Text("头像",style: TextStyle(
                      color:
                      ColorsUtil.hexColor(0xffffff),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold
                    ),),
                  )
                ],
              ),

              Container(
                  width: 35.w,
                  height: 35.w,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    httpHeaders: const {
                      'referer': 'http://app.xuanmengge.com'
                    },
                    placeholder: (context, url) => const Center(
                      child: CupertinoActivityIndicator(),
                    ),
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // borderRadius: BorderRadius.circular(5.r),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    imageUrl: widget.userInfoData.photo ?? "",
                  ))
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.h),
          height: 1.h,
          width: 1.sw-60.w,
          color: ColorsUtil.hexColor(0x414443),
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
                    child: Image.asset("assets/9.png"),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 9.w),
                    child: Text("昵称",style: TextStyle(
                        color:
                        ColorsUtil.hexColor(0xffffff),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold
                    ),),
                  )
                ],
              ),
              Text(widget.userInfoData.nickName ?? "",style: TextStyle(
                  color:
                  ColorsUtil.hexColor(0xB5B5B5),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold
              ))
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.h),
          height: 1.h,
          width: 1.sw-60.w,
          color: ColorsUtil.hexColor(0x414443),
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
                    child: Image.asset("assets/10.png"),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 9.w),
                    child: Text("手机号",style: TextStyle(
                        color:
                        ColorsUtil.hexColor(0xffffff),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold
                    ),),
                  )
                ],
              ),
              Text(widget.userInfoData.phone ?? "",style: TextStyle(
                  color:
                  ColorsUtil.hexColor(0xB5B5B5),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold
              ))
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.h),
          height: 1.h,
          width: 1.sw-60.w,
          color: ColorsUtil.hexColor(0x414443),
        ),
        InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          child: Container(
            margin: EdgeInsets.only(top: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 32.w,
                          height: 32.w,
                          child: Image.asset("assets/11.png"),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 9.w),
                          child: Text("区块链地址         ",style: TextStyle(
                              color:
                              ColorsUtil.hexColor(0xffffff),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold
                          ),),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 120.w),
                          child: Text(
                            widget.userInfoData.address ?? "",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.end,
                            softWrap: true,
                              style: TextStyle(
                                  color:
                                  ColorsUtil.hexColor(0xB5B5B5),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold
                              )
                          ),
                        )
                      ],
                    )),
                Icon(Icons.arrow_forward_ios,color: ColorsUtil.hexColor(0xB5B5B5))
              ],
            ),
          ),
          onTap: () {
            Navigator.push(
                context, RouteUtil.createRoute(BlockAddressPage(widget.userInfoData.address??"")));
          },
        ),
        Container(
          margin: EdgeInsets.only(top: 10.h),
          height: 1.h,
          width: 1.sw-60.w,
          color: ColorsUtil.hexColor(0x414443),
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
                      child: Image.asset("assets/12.png"),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 9.w),
                      child: Text("收货地址",style: TextStyle(
                          color:
                          ColorsUtil.hexColor(0xffffff),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold
                      ),),
                    ),
                  ],
                ),
                Icon(Icons.arrow_forward_ios,color: ColorsUtil.hexColor(0xB5B5B5))
              ],
            ),
          ),
          onTap: () {
            Navigator.push(
                context, RouteUtil.createRoute(UserAddressPage()));
          },
        )
      ],
    ),
  )
               
              
            ],
          ),
        )
        ,
      ),
    );
  }
}
