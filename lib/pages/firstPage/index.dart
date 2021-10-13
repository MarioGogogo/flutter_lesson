// ignore_for_file: prefer_const_constructors

/*
 * @Author: MarioGo
 * @Date: 2021-10-12 13:37:34
 * @LastEditTime: 2021-10-12 19:30:42
 * @LastEditors: MarioGo
 * @Description: 文件描述
 * @FilePath: /flutter_lesson/lib/pages/firstPage/index.dart
 * 可以输入预定的版权声明、个性签名、空行等
 */
import 'package:flutter/material.dart';
import 'package:flutter_lesson/demo/app_upgrade.dart';
import 'package:flutter_lesson/demo/base_login_route.dart';
import 'package:flutter_lesson/demo/base_refresh_listview.dart';
import 'package:flutter_lesson/demo/count_down.dart';
import 'package:flutter_lesson/demo/login_route.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xFFF5F5F7),
        child: ListView(
          children: [
            ListTile(
              title: Text("普通登录"),
              subtitle: Text('Get.toNamed("/demo")'),
              onTap: () => {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return BaseLoginRoute();
                }))
              },
            ),
            Divider(),
            ListTile(
              title: Text("登录泡泡"),
              subtitle: Text('Get.toNamed("/demo")'),
              onTap: () => {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return BobbleLoginPage();
                }))
              },
            ),
            Divider(),
            ListTile(
              title: Text("上啦刷新下来加载"),
              subtitle: Text('Get.toNamed("/demo")'),
              onTap: () => {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return BaseRefreshlistView();
                }))
              },
            ),
            Divider(),
            ListTile(
              title: Text("开屏倒计时"),
              subtitle: Text('Get.toNamed("/demo")'),
              onTap: () => {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CountdownRoute();
                }))
              },
            ),
            Divider(),
            ListTile(
              title: Text("升级App"),
              subtitle: Text('Get.toNamed("/demo")'),
              onTap: () => {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return UpdateAppPage();
                }))
              },
            ),
          ],
        ));
  }
}
