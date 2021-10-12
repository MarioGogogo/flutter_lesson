// ignore_for_file: sized_box_for_whitespace

/*
 * @Author: MarioGo
 * @Date: 2021-10-12 19:30:12
 * @LastEditTime: 2021-10-12 22:46:03
 * @LastEditors: MarioGo
 * @Description: 文件描述
 * @FilePath: /flutter_lesson/lib/demo/count_down.dart
 * 可以输入预定的版权声明、个性签名、空行等
 */
// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

class CountdownRoute extends StatefulWidget {
  CountdownRoute({Key? key}) : super(key: key);

  @override
  _CountdownRouteState createState() => _CountdownRouteState();
}

class _CountdownRouteState extends State<CountdownRoute> {
  late TimerUtil _timerUtil;
  late int _count;
  final int totalTime = 4 * 1000;

  @override
  void initState() {
    super.initState();
    _timerUtil = TimerUtil(mTotalTime: totalTime);
    //每一秒执行回调
    _timerUtil.setOnTimerTickCallback((int tick) {
      double _tick = tick / 1000;
      setState(() {
        _count = _tick.toInt();
        LogUtil.v(" count is  " + _count.toString());
      });
      if (_tick == 0) {
        print("跳转进入首页");
      }
    });

    //开始倒计时
    _timerUtil.startCountDown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              "lib/images/fa.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 80,
            left: 50,
            child: Material(
              color: Colors.transparent,
              //INK可以实现装饰容器
              child: Ink(
                //用ink圆角矩形
                decoration: BoxDecoration(
                  //不能同时”使用Ink的变量color属性以及decoration属性，两个只能存在一个
                  color: Colors.pink[300],
                  //设置圆角
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
                child: InkWell(
                  //圆角设置,给水波纹也设置同样的圆角
                  //如果这里不设置就会出现矩形的水波纹效果
                  borderRadius: BorderRadius.circular(25.0),
                  //设置点击事件回调
                  onTap: () {},
                  child: Container(
                    width: 300.0,
                    height: 50.0,
                    //设置child 居中
                    alignment: Alignment(0, 0),
                    child: Text(
                      "登录",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 40,
              right: 20,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12)),
                height: 30,
                width: 80,
                alignment: Alignment.center,
                child: Text("倒计时$_count秒"),
              ))
        ],
      ),
    );
  }
}
