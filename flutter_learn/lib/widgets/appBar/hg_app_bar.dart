import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learn/widgets/appBar/widgets/search_widget.dart';

/// 自定义AppBar
class HGAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HGAppBar({
    Key key,
    this.backgroundColor,
    this.title = '',
    this.centerTitle = '',
    this.actionName = '',
    this.backImg = '',
    this.onPressed,
    this.isBack = false,
    this.isSearchBar = true,
    this.titleColor = Colors.white,
    this.onSearch,
    this.hintText = '',
    this.showCancleBtn = true,
  }) : super(key: key);

  ///背景色
  final Color backgroundColor;

  ///左边文字,比如返回或者上个界面的标题
  final String title;

  ///中间文字
  final String centerTitle;

  ///标题颜色
  final Color titleColor;

  ///返回图标
  final String backImg;

  ///右边按钮文字
  final String actionName;

  ///右边按钮点击方法
  final VoidCallback onPressed;

  ///是否有返回按钮
  final bool isBack;

  ///是否包含搜索框
  final bool isSearchBar;

  ///搜索按钮点击事件
  final onSearch;

  ///输入框默认占位符
  final String hintText;

  ///是否展示右边取消/搜索按钮
  final bool showCancleBtn;

  ///左边子视图
  // final Widget leftChild;

  // ///右边子视图
  // final Widget rightChild;

  @override
  State<StatefulWidget> createState() {
    return _HGAppBarState();
  }

  @override
  Size get preferredSize => const Size.fromHeight(48.0);
}

class _HGAppBarState extends State<HGAppBar> {
  final TextEditingController _controller = TextEditingController(text: '');
  final FocusNode _focusNode = FocusNode();
  bool _isFocus = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          _isFocus = true;
        });
      } else {
        setState(() {
          _isFocus = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Color _backgroundColor;

    if (widget.backgroundColor == null) {
      _backgroundColor = Colors.blue[400];
    } else {
      _backgroundColor = widget.backgroundColor;
    }

    final SystemUiOverlayStyle _overlayStyle =
        ThemeData.estimateBrightnessForColor(_backgroundColor) ==
                Brightness.dark
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark;

    Widget back = widget.isBack
        ? IconButton(
            onPressed: () {
              FocusManager.instance.primaryFocus?.unfocus();
              Navigator.maybePop(context);
            },
            color: Colors.red,
            tooltip: 'Back',
            padding: const EdgeInsets.all(12.0),
            icon: widget.backImg.isEmpty
                ? Icon(
                    Icons.arrow_back_ios,
                    size: 18,
                    color: Colors.white,
                  )
                : Image.asset(
                    widget.backImg,
                    color: Colors.white,
                  ),
          )
        : SizedBox(
            width: 0,
          );

    Widget action = widget.actionName.isNotEmpty
        ? Container(
            child: Theme(
              data: Theme.of(context).copyWith(
                buttonTheme: const ButtonThemeData(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  minWidth: 60.0,
                ),
              ),
              child: FlatButton(
                child: Text(widget.actionName, key: const Key('actionName')),
                textColor: Colors.white,
                highlightColor: Colors.transparent,
                onPressed: widget.onPressed,
              ),
            ),
          )
        : SizedBox(width: 0);

    Widget titleWidget = Semantics(
      namesRoute: true,
      header: true,
      child: Container(
        alignment: widget.centerTitle.isEmpty
            ? Alignment.centerLeft
            : Alignment.center,
        child: Text(
          widget.title.isEmpty ? widget.centerTitle : widget.title,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 48.0),
      ),
    );

    Widget textfieldWidget = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 8,
        ),
        Icon(
          Icons.search,
          color: Color.fromRGBO(0, 0, 0, 0.2),
          size: 14,
        ),
        SizedBox(
          width: 4,
        ),
        Expanded(
          child: Container(
            height: 30,
            child: TextField(
              style:
                  TextStyle(color: Color.fromRGBO(0, 0, 0, 0.8), fontSize: 12),
              controller: _controller,
              focusNode: _focusNode,
              autofocus: true,
              textInputAction: TextInputAction.search,
              onEditingComplete: () {
                if (_controller.text.isNotEmpty) {
                  _focusNode.unfocus();
                  if (widget.onSearch != null) {
                    widget.onSearch(_controller.text);
                  }
                } else {
                  _focusNode.unfocus();
                }
              },
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: -18),
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                      fontSize: 12, color: Color.fromRGBO(0, 0, 0, 0.2)),
                  border: InputBorder.none,
                  fillColor: Colors.red),
            ),
          ),
        )
      ],
    );
    // Widget searchWidget = Container(
    //   padding: EdgeInsets.only(
    //       top: 8,
    //       bottom: 8,
    //       left: widget.isBack ? 0 : 16,
    //       right: widget.actionName.isNotEmpty ? 0 : 16),
    //   color: _backgroundColor,
    //   child: Row(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Expanded(
    //         child: Container(
    //           height: 30,
    //           decoration: BoxDecoration(
    //               color: Colors.white,
    //               borderRadius: BorderRadius.circular(4),
    //               border: Border.all(
    //                   color: Color.fromRGBO(0, 0, 0, 0.1), width: 1)),
    //           child: textfieldWidget,
    //         ),
    //       ),
    //       (widget.showCancleBtn && _isFocus)
    //           ? InkWell(
    //               onTap: () {
    //                 if (_controller.text.isNotEmpty && !_focusNode.hasFocus) {
    //                   if (widget.onSearch != null) {
    //                     widget.onSearch(_controller.text);
    //                   }
    //                 } else {
    //                   _focusNode.unfocus();
    //                 }
    //               },
    //               child: Container(
    //                 width: 56,
    //                 height: 26,
    //                 alignment: Alignment.center,
    //                 child: Text(
    //                   (_controller.text.isNotEmpty && !_focusNode.hasFocus)
    //                       ? '搜索'
    //                       : '取消',
    //                   style: TextStyle(
    //                       fontSize: 14,
    //                       height: 1.4,
    //                       color: Theme.of(context).primaryColor),
    //                 ),
    //               ))
    //           : SizedBox(
    //               width: 0,
    //             )
    //     ],
    //   ),
    // );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayStyle,
      child: Material(
        color: _backgroundColor,
        child: SafeArea(
          left: false,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              back,
              widget.isSearchBar
                  ? Expanded(
                      child: SearchWidget(
                        // isShowBtn: true,
                        padding: EdgeInsets.only(
                            left: widget.isBack ? 0 : 16,
                            top: 7,
                            bottom: 7,
                            right: widget.actionName.isEmpty ? 16 : 0),
                      ),
                    )
                  : titleWidget,
              action,
            ],
          ),
        ),
      ),
    );
  }
}
