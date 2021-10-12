// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

/*
 * @Author: MarioGo
 * @Date: 2021-10-12 13:12:38
 * @LastEditTime: 2021-10-12 13:54:47
 * @LastEditors: MarioGo
 * @Description: 文件描述
 * @FilePath: /flutter_lesson/lib/main.dart
 * 可以输入预定的版权声明、个性签名、空行等
 */
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lesson/pages/firstPage/index.dart';
import 'package:flutter_lesson/pages/secondPage/index.dart';
import 'package:flutter_lesson/pages/threePage/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  //定义controller 类型
  final PageController _controller = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter-lesson"),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          index: _currentIndex,
          backgroundColor: Color(0xFFF5F5F7),
          key: _bottomNavigationKey,
          items: <Widget>[
            Icon(Icons.add, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.compare_arrows, size: 30),
          ],
          onTap: (index) {
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
            print(_bottomNavigationKey.currentState);
          },
        ),
        body: PageView(
          controller: _controller,
          children: [FirstPage(), SecondPage(), ThreePage()],
        ));
  }
}
