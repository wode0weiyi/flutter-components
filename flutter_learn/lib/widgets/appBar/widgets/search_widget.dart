import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key key,
    this.hintStyle,
    this.hintText = '',
    this.searchBtnColor,
    this.searchBtnStyle,
    this.bgColor = Colors.transparent,
    this.border,
    this.isShowBtn = false,
    this.onSearch,
    this.padding,
  }) : super(key: key);

  ///占位字符样式
  final TextStyle hintStyle;

  ///占位字符
  final String hintText;

  ///搜索按钮背景色，默认 blue[400]
  final Color searchBtnColor;

  ///搜索按钮的文字样式
  final TextStyle searchBtnStyle;

  /// padding
  final EdgeInsets padding;

  ///背景颜色
  final Color bgColor;

  ///搜索框边框颜色
  final Border border;

  ///是否展示搜索按钮
  final bool isShowBtn;

  ///搜索按钮响应事件
  final onSearch;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      padding: padding != null
          ? padding
          : EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      child: Container(
        padding: EdgeInsets.only(left: 8, right: isShowBtn ? 0 : 8),
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(15),
            border: border != null
                ? border
                : Border.all(color: Color.fromRGBO(0, 0, 0, 0.1))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.search,
                  size: 14,
                  color: hintStyle != null ? hintStyle.color : Colors.white,
                ),
                SizedBox(width: 4),
                Text(
                  hintText.isEmpty ? '搜索...' : hintText,
                  style: hintStyle != null
                      ? hintStyle
                      : TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
            if (isShowBtn)
              FlatButton(
                onPressed: onSearch,
                color:
                    searchBtnColor != null ? searchBtnColor : Colors.blue[400],
                height: 30,
                minWidth: 56,
                child: Text(
                  '搜索',
                  style: searchBtnStyle != null
                      ? searchBtnStyle
                      : TextStyle(color: Colors.white, fontSize: 14),
                ),
              )
          ],
        ),
      ),
    );
  }
}
