import 'package:digital_collection/home/home_page.dart';
import 'package:digital_collection/my/my_page.dart';
import 'package:digital_collection/util/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseTabBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BaseTabBarState();
  }
}

class BaseTabBarState extends State<BaseTabBar>
    with AutomaticKeepAliveClientMixin {
  int currentIndex = 0;
  final PageController controller = PageController(
    initialPage: 0,
  );

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // Provider.of<PrefetchData>(context, listen: false).getDeviceInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          HomePage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          brightness: Brightness.light,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              //一
              icon: Container(
                width: 11.w,
                height: 9.h,
                decoration: new BoxDecoration(),
                // child: Image.asset("assets/***.png"),
                child: Icon(Icons.home),
              ),
              activeIcon: Container(
                  width: 11.w,
                  height: 9.h,
                  decoration: new BoxDecoration(),
                  child: Icon(Icons.home)),

              title: Text('首页',
                  style: TextStyle(
                      color: currentIndex != 0
                          ? ColorsUtil.hexColor(0x999999)
                          : ColorsUtil.hexColor(0x333333),
                      fontWeight: currentIndex != 0
                          ? FontWeight.normal
                          : FontWeight.bold,
                      fontSize: 5.sp)),
            ),
            BottomNavigationBarItem(
              //一
              icon: Container(
                  width: 11.w,
                  height: 9.h,
                  decoration: new BoxDecoration(),
                  child: Icon(Icons.person)),
              activeIcon: Container(
                  width: 11.w,
                  height: 9.h,
                  decoration: new BoxDecoration(),
                  child: Icon(Icons.person)),
              title: Text('我的',
                  style: TextStyle(
                      color: currentIndex != 1
                          ? ColorsUtil.hexColor(0x999999)
                          : ColorsUtil.hexColor(0x333333),
                      fontWeight: currentIndex != 1
                          ? FontWeight.normal
                          : FontWeight.bold,
                      fontSize: 5.sp)),
            ),
          ],
          onTap: (index) {
            if (index != currentIndex) {
              controller.jumpToPage(index);
              setState(() {
                currentIndex = index;
              });
            }
          },
        ),
      ),
    );
  }
}
