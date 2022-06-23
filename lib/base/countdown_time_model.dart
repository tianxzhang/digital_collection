import 'dart:async';

import 'package:flutter/material.dart';

class CountDownTimeModel extends ChangeNotifier {
  int _timeTotal = 60; //倒计总时长
  int _interval = 1; //倒计单位
  int currentTime = 60; //倒计时当前时间
  Timer? _timer; //倒计器
  bool isFirst = true;

  int get() => currentTime;

  bool get isFinish => currentTime == _timeTotal;

  bool get isNotClicked => this.isFirst;

  CountDownTimeModel(this._timeTotal, this._interval);

  void startCountDown() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }

    isFirst = false;

    _timer = Timer.periodic(Duration(seconds: _interval), (timer) {
      if (timer.tick == _timeTotal) {
        //倒计完当前时间重新等于总时间
        currentTime = _timeTotal;
        _timer!.cancel();
        _timer = null;
      } else {
        currentTime--;
      }
      //触发监听
      notifyListeners();
    });
  }

  void cancelTimer() {
    _timer!.cancel();
    _timer = null;
  }

  @override
  void dispose() {
    _timer!.cancel();
    _timer = null;
    super.dispose();
  }
}
