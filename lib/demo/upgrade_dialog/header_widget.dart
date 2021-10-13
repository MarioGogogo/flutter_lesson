import 'package:flutter/material.dart';
import 'package:flutter_lesson/utils/navigator_utils.dart';


class HeaderWidget extends StatelessWidget {
  final BuildContext context;
  const HeaderWidget({Key? key,required this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          const Positioned(
            left: 0,
            right: 0,
            top: 28,
            child: Text(
              "升级版本",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.blue),
            ),
          ),
          //右上角
          Positioned(
            right: 0,
            child: CloseButton(
              onPressed: () {
                NavigatorUtils.closeApp(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
