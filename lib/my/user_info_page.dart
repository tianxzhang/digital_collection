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
      body: SafeArea(
        child: Column(
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
                    child: Text("个人信息",
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
              margin: EdgeInsets.only(top: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.person),
                      Container(
                        child: Text("头像"),
                      )
                    ],
                  ),
                  Container(
                      width: 15.w,
                      height: 15.h,
                      child: CachedNetworkImage(
                        fit: BoxFit.contain,
                        httpHeaders: const {
                          'referer': 'http://app.xuanmengge.com'
                        },
                        placeholder: (context, url) => const Center(
                          child: CupertinoActivityIndicator(),
                        ),
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.contain,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.paste),
                      Container(
                        child: Text("昵称"),
                      )
                    ],
                  ),
                  Text(widget.userInfoData.nickName ?? "")
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
                      Icon(Icons.phone_android),
                      Container(
                        child: Text("手机号"),
                      )
                    ],
                  ),
                  Text(widget.userInfoData.phone ?? "")
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
                    Expanded(
                        child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.share),
                        Container(
                          child: Text("区块链地址   "),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 120.w),
                          child: Text(
                            widget.userInfoData.address ?? "",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            softWrap: true,
                          ),
                        )
                      ],
                    )),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                    context, RouteUtil.createRoute(BlockAddressPage(widget.userInfoData.address??"")));
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
                        Icon(Icons.location_on),
                        Container(
                          child: Text("收货地址"),
                        )
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios)
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
      ),
    );
  }
}
