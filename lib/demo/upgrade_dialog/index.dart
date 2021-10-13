import 'package:flutter/material.dart';
import 'package:flutter_lesson/demo/upgrade_dialog/update_dialog.dart';
import 'package:flutter_lesson/utils/navigator_utils.dart';

//方法函数
void showAppUpgradeDialog(
    {required BuildContext context,
    required String upgradText,
    required String apkUrl,
    bool isForce = false, //是否强制更新
    bool isBackDismiss = false //点击背景是否消失
    }) {
  NavigatorUtils.pushPageByFade(
      context: context,
      opaque: false,
      targPage: UpgradeAppDialog(
        context: context,
        isBackDismiss: isBackDismiss,
        isForce: isForce,
        upgradText: upgradText,
        apkUrl: apkUrl,
      ));
}
