import 'package:flutter/material.dart';
import 'package:flutter_learn/res/styles.dart';
import 'package:flutter_learn/widgets/tq_expandableText.dart';

class ExpandText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('文字折叠'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: TQExpandableText(
            '测试长文字折叠测试长文字折叠测试长文字折叠测试长文字折叠测试长文字折叠测试长文字折叠测试长文字折叠测试长文字折叠测试长文字折叠测试长文字折叠测试长文字折叠测试长文字折叠测试长文字折叠测试长文字折叠测试长文字折叠测试长文字折叠测试长文字折叠测试长文字折叠',
            style: TextStyle(fontSize: 20, height: 1.5),
            expandText: '展开',
            collapseText: '收起'),
      ),
    );
  }
}
