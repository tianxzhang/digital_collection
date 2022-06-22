// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  MyPageState createState() => MyPageState();
}

class MyPageState extends State<MyPage>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("My"),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
