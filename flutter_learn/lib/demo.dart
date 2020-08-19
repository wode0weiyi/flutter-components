import 'package:flutter/material.dart';
import 'package:flutter_learn/provider/theme_provider.dart';
import 'package:flutter_learn/widgets/search/hg_serach_bar.dart';
import 'package:provider/provider.dart';

class DemoDart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('theme', style: TextStyle(color: Colors.red))),
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
