import 'package:digital_collection/util/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toast/toast.dart';

class BlockAddressPage extends StatefulWidget {
  final String blockAddress;

  BlockAddressPage(this.blockAddress);

  @override
  BlockAddressPageState createState() => BlockAddressPageState();
}

class BlockAddressPageState extends State<BlockAddressPage>
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
                          child: Text("区块链地址",
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
                    margin: EdgeInsets.only(top: 30.5.h),
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            child: Image.asset(
                              "assets/13.png",
                              width: 100.w,
                              height: 100.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 21.h),
                            child: Text("区块链地址",
                                style: TextStyle(
                                    color: ColorsUtil.hexColor(0xffffff),
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold
                                )),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 22.h),
                            child: Text("区块链地址是你在区块链上持有藏品的唯一地址",
                                style: TextStyle(
                                    color: ColorsUtil.hexColor(0xB5B5B5 ),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.normal
                                )),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 28.h),
                            padding: EdgeInsets.symmetric(horizontal: 7.5.w),
                            height: 96.h,
                            width: 1.sw-30.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(color: ColorsUtil.hexColor(0x343635 ),borderRadius: BorderRadius.circular(30)),
                            child: Text(widget.blockAddress,
                                style: TextStyle(
                                    color: ColorsUtil.hexColor(0xffffff),
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                ),maxLines: 3,softWrap: true,textAlign: TextAlign.center,),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              InkWell(
                child: Container(
                  margin: EdgeInsets.only(bottom: 32.h),
                  width: 1.sw-30,
                  height: 50.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorsUtil.hexColor(0xF7BD50)
                  ),
                  child: Center(
                    child: Text(
                      "复制地址",
                      style: TextStyle(
                          color: ColorsUtil.hexColor(0x1A0F00),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                onTap: () {
                  Clipboard.setData(ClipboardData(text: widget.blockAddress));
                  Toast.show("地址已复制");
                },
              ),
            ],
          ),
        )
      )
    );
  }
}
