/*
 * @Author: MarioGo
 * @Date: 2021-10-12 14:53:50
 * @LastEditTime: 2021-10-12 14:54:59
 * @LastEditors: MarioGo
 * @Description: 文件描述
 * @FilePath: /flutter_lesson/lib/widgets/button.dart
 * 可以输入预定的版权声明、个性签名、空行等
 */
import 'package:flutter/material.dart';

///自定义按钮
class ButtonWidget extends StatelessWidget {
  //按钮上的文字
  final String buttonLabel;
  //是否填充背景
  final bool hasBorder;
  //点击事件回调
  final GestureTapCallback onTap;

  ButtonWidget({
    Key? key,
    required this.buttonLabel,
    this.hasBorder = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        //边框
        decoration: BoxDecoration(
          //定义填充颜色
          color: hasBorder ? Colors.white : Theme.of(context).accentColor,
          //点击事件高亮的边框圆角
          borderRadius: BorderRadius.circular(10),
          //边框设置
          border: hasBorder
              ? Border.all(
                  color: Theme.of(context).accentColor,
                  width: 1.0,
                )
              : Border.fromBorderSide(BorderSide.none),
        ),
        //事件监听回调
        child: buildInkWell(context),
      ),
    );
  }

  InkWell buildInkWell(BuildContext context) {
    return InkWell(
      //事件回调
      onTap: onTap,
      //点击的水波纹与高亮颜色 与Ink设置的背景圆角一致
      borderRadius: BorderRadius.circular(10),
      //按钮样式
      child: Container(
        height: 60.0,
        child: Center(
          child: Text(
            //文本内容
            buttonLabel,
            //文本样式
            style: TextStyle(
              //文本颜色
              color: hasBorder ? Theme.of(context).accentColor : Colors.white,
              //加粗
              fontWeight: FontWeight.w600,
              //文字大小
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
