import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//路由工具类

class NavigatorUtils{
  static void pushPage({
    required BuildContext context,
    required Widget targPage,
    bool isReplace = false,
    Function(dynamic value)? dismissCallBack,
  }) {
    PageRoute pageRoute;

    if (Platform.isAndroid) {
      pageRoute = MaterialPageRoute(builder: (BuildContext context) {
        return targPage;
      });
    } else {
      pageRoute = CupertinoPageRoute(builder: (BuildContext context) {
        return targPage;
      });
    }

    if (isReplace) {
      Navigator.of(context).pushReplacement(pageRoute).then((value) {
        if (dismissCallBack != null) {
          dismissCallBack(value);
        }
      });
    } else {
      Navigator.of(context).push(pageRoute).then((value) {
        if (dismissCallBack != null) {
          dismissCallBack(value);
        }
      });
    }
  }
  ///普通打开页面的方法
  static void pushPageByFade({
   // 上下文对象
    required BuildContext context,
  // 目标页面
    required Widget targPage,
  // 是否替换当前页面  A -B - c  把 B干掉 只留下 [A C]
    bool isReplace = false,
    int startMills = 400,  //动画时间
  // 是否以背景透明的方式打开页面
    bool opaque = false,
    // 回调
    Function(dynamic value)? dismissCallBack,
  }) {
    // 自定义路由
    PageRoute pageRoute = PageRouteBuilder(
      //背景透明 方式打开新的页面
      opaque: opaque,
      // 构建目标页面
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return targPage;
      },
      transitionDuration: Duration(milliseconds: startMills),
      //动画
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );

    // 替换
    if (isReplace) {
      // 动态路由替换法
      Navigator.of(context).pushReplacement(pageRoute).then((value) {
        if (dismissCallBack != null) {
          dismissCallBack(value);
        }
      });
    } else {
      Navigator.of(context).push(pageRoute).then((value) {
        if (dismissCallBack != null) {
          dismissCallBack(value);
        }
      });
    }
  }

  //  关闭弹窗
  static void closeApp(BuildContext context) {
    //最好是有一个再次点击时间控制
    //笔者这里省略
    //如果正在下载中 取消网络请求
    Navigator.of(context).pop();
    // if (_cancelToken != null && !_cancelToken!.isCancelled) {
    //   //取消下载
    //   _cancelToken!.cancel();
    // }
    // //如果是强制升级 点击物理返回键退出应用程序
    // if (widget.isForce) {
    //   SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    // } else {
    //   Navigator.of(context).pop();
    // }
  }
}