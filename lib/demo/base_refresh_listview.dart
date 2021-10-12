// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables

/*
 * @Author: MarioGo
 * @Date: 2021-10-12 17:05:58
 * @LastEditTime: 2021-10-12 19:52:22
 * @LastEditors: MarioGo
 * @Description: 文件描述
 * @FilePath: /flutter_lesson/lib/demo/base_refresh_listview.dart
 * 可以输入预定的版权声明、个性签名、空行等
 */
import 'package:flutter/material.dart';

class BaseRefreshlistView extends StatefulWidget {
  BaseRefreshlistView({Key? key}) : super(key: key);

  @override
  _BaseRefreshlistViewState createState() => _BaseRefreshlistViewState();
}

class _BaseRefreshlistViewState extends State<BaseRefreshlistView> {
  //ListView 数据源
  List list = [];
  //ScrollController可以监听滑动事件，判断当前view所处的位置
  final ScrollController _scrollController = ScrollController();
  //分页 加载的页数
  int _page = 1;
  //是否正在加载数据
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    //初始化模拟数据
    list = List.generate(15, (i) => '哈喽,我是原始数据 $i');
    //设置监听
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('滑动到了最底部');
        _getMore(); //下一页
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("list"),
      ),
      body: RefreshIndicator(
        //下拉刷新触发方法
        onRefresh: _onRefresh,
        //设置listView
        child: ListView.builder(
          //条目显示布局
          itemBuilder: _renderRow,
          //listView 的控制器
          controller: _scrollController,
          //条目个数据  这里+1 是最后一条目显示 加载更多提示
          itemCount: list.length + 1,
        ),
      ),
    );
  }

  //加载更多
  Future _getMore() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });

      await Future.delayed(Duration(seconds: 1), () {
        setState(() {
          list.addAll(List.generate(5, (i) => "第$_page次上拉来的数据"));
          _page++;
          isLoading = false;
        });
      });
    }
  }

  // 下拉刷新方法,为list重新赋值
  Future _onRefresh() async {
    await Future.delayed(Duration(seconds: 1), () {
      print('刷新');
      setState(() {
        list = List.generate(20, (i) => '哈喽,我是新刷新的 $i');
      });
    });
  }

  Widget _renderRow(BuildContext context, int index) {
    if (index < list.length) {
      return ListTile(
        title: Text(list[index]),
      );
    }
    return _getMoreWidget();
  }

  Widget _getMoreWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '加载资源...     ',
              style: TextStyle(fontSize: 16.0),
            ),
            CircularProgressIndicator(
              strokeWidth: 1.0,
            )
          ],
        ),
      ),
    );
  }
}
