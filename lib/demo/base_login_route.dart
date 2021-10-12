// ignore_for_file: prefer_const_constructors

/*
 * @Author: MarioGo
 * @Date: 2021-10-12 16:21:29
 * @LastEditTime: 2021-10-12 17:01:07
 * @LastEditors: MarioGo
 * @Description: 文件描述
 * @FilePath: /flutter_lesson/lib/demo/base_login_route.dart
 * 可以输入预定的版权声明、个性签名、空行等
 */

import 'package:flutter/material.dart';

class BaseLoginRoute extends StatefulWidget {
  const BaseLoginRoute({Key? key}) : super(key: key);

  @override
  _BaseLoginRouteState createState() => _BaseLoginRouteState();
}

class _BaseLoginRouteState extends State<BaseLoginRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F7),
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 120,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 30),
                color: Colors.white,
                child: Icon(Icons.access_alarm),
              ),
              Container(
                color: Colors.white,
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Container(
                  child: buildForm(),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  //绑定用户名事件名   =====  类似 vue  refs 直接拿取里面的值  unameController.text
  TextEditingController unameController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  GlobalKey formKey = GlobalKey<FormState>();

  //创建登录input 和按钮
  Widget buildForm() {
    return Form(
        //设置globalKey，用于后面获取FormState
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              //键盘回车键的样式
              controller: unameController,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  labelText: "用户名或者工号",
                  hintText: "用户名或者工号",
                  icon: Icon(Icons.person)),
              validator: (String? value) {
                return (value != null && value.length < 6) ? '用户名长度大于6位' : null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: pwdController,
              decoration: InputDecoration(
                  labelText: "密码", hintText: "您的登录密码", icon: Icon(Icons.lock)),
              validator: (String? value) {
                return (value != null && value.length < 6) ? '密码必须大于6位' : null;
              },
            ),
            Padding(
                padding: EdgeInsets.only(top: 28),
                child: Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue, padding: EdgeInsets.all(15)),
                      child: Text("登录"),
                      onPressed: () {
                        //在这里不能通过此方式获取FormState，context不对
                        //print(Form.of(context));
                        // 通过_formKey.currentState 获取FormState后，
                        // 调用validate()方法校验用户名密码是否合法，校验
                        // 通过后再提交数据。
                        if ((formKey.currentState as FormState).validate()) {
                          //验证通过提交数据
                          print("验证成功,${unameController.text}");
                        }
                      },
                    ))
                  ],
                ))
          ],
        ));
  }
}
