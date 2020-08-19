import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key key,
    this.hintText = '',
    this.onSearch,
    this.showCancleBtn = true,
  }) : super(key: key);
  final String hintText;
  final onSearch;
  final bool showCancleBtn;

  @override
  State<StatefulWidget> createState() {
    return _SearchBarState();
  }
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _controller = TextEditingController(text: '');
  final FocusNode _node = FocusNode();
  bool _isInput = false;

  @override
  void initState() {
    super.initState();
    _node.addListener(() {
      debugPrint(
          '-------------${_controller.text.isEmpty}---${_node.hasFocus}');
      if (!_node.hasFocus) {
        // 失去焦点
        setState(() {
          _isInput = _controller.text.isEmpty ? false : true;
        });
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    // 如果允许输入且输入框没有输入内容，则聚焦。否则不做操作
    if (_isInput && _controller.text.isEmpty) {
      FocusScope.of(context).requestFocus(_node);
    }
    return Container(
      padding: EdgeInsets.only(
          top: 8,
          bottom: 8,
          left: 16,
          right: (!widget.showCancleBtn || !_isInput) ? 16 : 0),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isInput = true;
                });
              },
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                        color: Color.fromRGBO(0, 0, 0, 0.1), width: 1)),
                child: _isInput ? _buildInput() : _buildNoInput(),
              ),
            ),
          ),
          (widget.showCancleBtn && (_controller.text.isNotEmpty || _isInput))
              ? InkWell(
                  onTap: () {
                    if (_controller.text.isNotEmpty && !_node.hasFocus) {
                      if (widget.onSearch != null) {
                        widget.onSearch(_controller.text);
                      }
                    } else {
                      _node.unfocus();
                    }
                  },
                  child: Container(
                    width: 56,
                    height: 26,
                    alignment: Alignment.center,
                    child: Text(
                      (_controller.text.isNotEmpty && !_node.hasFocus)
                          ? '搜索'
                          : '取消',
                      style: TextStyle(
                          fontSize: 14,
                          height: 1.4,
                          color: Theme.of(context).primaryColor),
                    ),
                  ))
              : SizedBox(
                  width: 0,
                )
        ],
      ),
    );
  }

  Widget _buildNoInput() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.search,
          color: Color.fromRGBO(0, 0, 0, 0.2),
          size: 14,
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          widget.hintText,
          style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.2), fontSize: 12),
        )
      ],
    );
  }

  Widget _buildInput() {
    return Row(
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
              focusNode: _node,
              autofocus: true,
              textInputAction: TextInputAction.search,
              onEditingComplete: () {
                if (_controller.text.isNotEmpty) {
                  _node.unfocus();
                  if (widget.onSearch != null) {
                    widget.onSearch(_controller.text);
                  }
                } else {
                  _node.unfocus();
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
  }
}
