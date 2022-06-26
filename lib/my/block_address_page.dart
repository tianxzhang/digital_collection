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
                        child: Text("区块链地址",
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
                  margin: EdgeInsets.only(top: 30.5.h),
                  height: 100.h,
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          child: Image.asset(
                            "assets/start_page.png",
                            // width: 32.5.w,
                            height: 32.5.w,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 6.h),
                          child: Text("区块链地址",
                              style: TextStyle(
                                  color: ColorsUtil.hexColor(0x333333),
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.bold
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 3.h),
                          child: Text("区块链地址是你在区块链上持有藏品的唯一地址",
                              style: TextStyle(
                                  color: ColorsUtil.hexColor(0x666666),
                                  fontSize: 6.sp,
                                  fontWeight: FontWeight.bold
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 3.h),
                          child: Text(widget.blockAddress,
                              style: TextStyle(
                                  color: ColorsUtil.hexColor(0x666666),
                                  fontSize: 6.sp,
                                  fontWeight: FontWeight.bold
                              )),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            InkWell(
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
                    "复制地址",
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 8.sp,
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
    );
  }
}
