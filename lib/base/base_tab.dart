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
              icon: Container(
                width: 25.w,
                decoration: new BoxDecoration(),
                // child: Image.asset("assets/***.png"),
                child: Icon(Icons.home,color: ColorsUtil.hexColor(0xB5B5B5),),
              ),
              activeIcon: Container(
                  width: 25.w,
                  decoration: new BoxDecoration(),
                  child: Icon(Icons.home,color: ColorsUtil.hexColor(0xF7BD50),)),
              title: Text('首页',
                  style: TextStyle(
                      color: currentIndex != 0
                          ? ColorsUtil.hexColor(0xB5B5B5)
                          : ColorsUtil.hexColor(0xF7BD50),
                      fontWeight: currentIndex != 0
                          ? FontWeight.normal
                          : FontWeight.bold,
                      fontSize: 10.sp)),
            ),
            BottomNavigationBarItem(
              icon: Container(
                  width: 25.w,
                  decoration: new BoxDecoration(),
                  child: Icon(Icons.person,color: ColorsUtil.hexColor(0xB5B5B5))),
              activeIcon: Container(
                  width: 25.w,
                  decoration: new BoxDecoration(),
                  child: Icon(Icons.person,color: ColorsUtil.hexColor(0xF7BD50))),
              title: Text('我的',
                  style: TextStyle(
                      color: currentIndex != 1
                          ? ColorsUtil.hexColor(0xB5B5B5)
                          : ColorsUtil.hexColor(0xF7BD50),
                      fontWeight: currentIndex != 1
                          ? FontWeight.normal
                          : FontWeight.bold,
                      fontSize: 10.sp)),
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
