import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_lesson/utils/navigator_utils.dart';

import 'header_widget.dart';

class UpgradeAppDialog extends StatefulWidget {
  final BuildContext context;
  final bool isBackDismiss;
  final bool isForce;
  final String upgradText;
  final String apkUrl;
  const UpgradeAppDialog(
      {Key? key,
        required this.context,
        this.isForce = false,
        this.upgradText = "",
        this.apkUrl = "",
        this.isBackDismiss = false,})
      : super(key: key);

  @override
  _UpgradeAppDialogState createState() => _UpgradeAppDialogState();
}

class _UpgradeAppDialogState extends State<UpgradeAppDialog> {
  // 动画控制器
  final StreamController<double> _streamController = StreamController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Material(
          type: MaterialType.transparency,
          child: WillPopScope(   //安卓物理返回键
              child: GestureDetector(
                onTap: () {
                  NavigatorUtils.closeApp(context);
                },
                child: buildBodyContainer(context), //内容
              ),
              onWillPop: () async {
                NavigatorUtils.closeApp(context);
                //如果返回false 就是拦截事件向上传递 类似js阻止冒泡
                return Future.value(true);
              })),
    );
  }

  //渲染内容
  Container buildBodyContainer(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        // 居中
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            child: Container(
              width: 280,
              height: 320,
              color: Colors.white,
              child: buildColumn(context),
            ),
          )
        ],
      ),
    );
  }

  //弹窗内容
  Widget buildColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //显示标题
        HeaderWidget(context: context),
        // 占位
        const SizedBox(
          height: 12,
        ),
        Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(left: 14, right: 14),
                child: const Text(
                  "widget",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            )),
        StreamBuilder(
            stream: _streamController.stream,
            initialData: 0.0,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Container(
                child: Stack(
                  children: [
                    Material(
                      color: Colors.redAccent,
                      child: Ink(
                        child: InkWell(
                          //点击事件
                          onTap: onTapFunction,
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: const Text(
                              //不同状态显示不同的文本内容
                              "点击更新",
                              style:
                              TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    ClipRect(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        widthFactor: snapshot.data, // 0 --- 1 过度
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                    )
                  ],
                ),
              );
            })
      ],
    );
  }

//-================================
  //点击下载
  void onTapFunction() {
    //判断ios就跳appstore
    downApkFunction();
  }

  double num = 0.0;
  void downApkFunction() {
    num+=0.1;
    _streamController.add(num);
    Stream.periodic(const Duration(seconds: 1),(i){
      print("$i");
      setState(() {
      });
      return i;
    });

    // print("下载完成");
    // setState(() {
    //   _streamController.add(0.0);
    // });
  }
}