import 'package:flutter/material.dart';
import 'package:flutter_learn/provider/theme_provider.dart';
import 'package:flutter_learn/widgets/appBar/hg_app_bar.dart';
import 'package:flutter_learn/widgets/search/hg_serach_bar.dart';
import 'package:provider/provider.dart';

class DemoDart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: HGAppBar(
        centerTitle: '搜索',
        isBack: true,
        actionName: '菜单',
        leftChild: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.menu)),
        rightChild: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Icon(
                Icons.message,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '消息',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
        onSearch: () {},
        onPressed: () {},
        // isBack: false,
      ),
      body: Container(
        child: Column(
          children: [
            SearchBar(
              hintText: '搜索',
              onSearch: (text) {},
            ),
            // Text(
            //   '动态变化颜色',
            //   style: Provider.of<ThemeProvider>(context).style14,
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Text(
            //   '动态变化颜色',
            //   style: Provider.of<ThemeProvider>(context).style14,
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Text(
            //   '动态变化颜色',
            //   style: Provider.of<ThemeProvider>(context).style14,
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Text(
            //   '动态变化颜色',
            //   style: Provider.of<ThemeProvider>(context).style14,
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Text(
            //   '动态变化颜色',
            //   style: Provider.of<ThemeProvider>(context).style14,
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Text(
            //   '动态变化颜色',
            //   style: Provider.of<ThemeProvider>(context).style14,
            // ),
            // SizedBox(
            //   height: 10,
            // ),
          ],
        ),
      ),
    );
  }
}
