
// 案例地址
// https://github.com/zhaolongs/flutter-ho/blob/main/lib/src/pages/common/app_upgrade.dart
/*
 * @Author: MarioGo
 * @Date: 2021-10-13 15:39:17
 * @LastEditTime: 2021-10-13 17:50:02
 * @LastEditors: MarioGo
 * @Description: 文件描述
 * @FilePath: /flutter_lesson/lib/demo/update_app_route.dart
 * 可以输入预定的版权声明、个性签名、空行等
 */

import 'package:flutter/material.dart';
import 'package:flutter_lesson/demo/upgrade_dialog/index.dart';

class UpdateAppPage extends StatefulWidget {
  const UpdateAppPage({Key? key}) : super(key: key);

  @override
  _UpdateAppPageState createState() => _UpdateAppPageState();
}

class _UpdateAppPageState extends State<UpdateAppPage>{

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("版本更新"),
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                check();
              },
              child: const Text("版本更新")),
        ));
  }

  void check() {
    /**
     * 1.获取异步接口请求获取当前版本信息
     * 2。比较2个版本如果存在差异就更新
     */
    if (true) {
      showAppUpgradeDialog(
          context: context,
          upgradText: "优化了一些BUG，程序员们正在努力中",
          apkUrl: "http://www.baidu.com");
    }
  }
}







