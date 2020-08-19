import 'dart:ui';

import 'package:flutter_learn/common/common.dart';
import 'package:flutter_learn/res/colors.dart';
import 'package:flutter_learn/res/styles.dart';
import 'package:flutter_learn/routers/web_page_transitions.dart';
import 'package:sp_util/sp_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension ThemeModeExtension on ThemeMode {
  String get value => ['System', 'Light', 'Dark'][index];
}

class ThemeProvider extends ChangeNotifier {
  Color _textColor;
  Color get textColor => _textColor;
  setTextColor(Color color) {
    _textColor = color;
    notifyListeners();
  }

  double _fontScale = 1;
  double get fontScale => _fontScale;
  setFontScale({double scale: 1}) {
    if (_fontScale != scale) {
      _fontScale = scale;
      setStyle18();
      setStyle14();
    }
    // notifyListeners();
  }

  TextStyle _style18 = TextStyle(color: Colors.red, fontSize: 18);
  TextStyle get style18 => _style18;
  setStyle18({Color color}) {
    _style18 = TextStyle(
        color: color == null ? _style18.color : color,
        fontSize: 18 * fontScale);
    notifyListeners();
  }

  TextStyle _style14 = TextStyle(color: Colors.black, fontSize: 14);
  TextStyle get style14 => _style14;
  setStyle14({Color color}) {
    _style14 = TextStyle(
        color: color == null ? _style14.color : color,
        fontSize: 14 * fontScale);
    notifyListeners();
  }

  void syncTheme() {
    final String theme = SpUtil.getString(Constant.theme);
    if (theme.isNotEmpty && theme != ThemeMode.system.value) {
      notifyListeners();
    }
  }

  void setTheme(ThemeMode themeMode) {
    SpUtil.putString(Constant.theme, themeMode.value);
    notifyListeners();
  }

  ThemeMode getThemeMode() {
    final String theme = SpUtil.getString(Constant.theme);
    switch (theme) {
      case 'Dark':
        return ThemeMode.dark;
      case 'Light':
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  ThemeData getTheme({bool isDarkMode = false}) {
    return ThemeData(
      errorColor: isDarkMode ? Colours.dark_red : Colours.red,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      primaryColor: isDarkMode ? Colours.dark_app_main : Colours.app_main,
      accentColor: isDarkMode ? Colours.dark_app_main : Colours.app_main,
      // Tab指示器颜色
      indicatorColor: isDarkMode ? Colours.dark_app_main : Colours.app_main,
      // 页面背景色
      scaffoldBackgroundColor:
          isDarkMode ? Colours.dark_bg_color : Colors.white,
      // 主要用于Material背景色
      canvasColor: isDarkMode ? Colours.dark_material_bg : Colors.white,
      // 文字选择色（输入框复制粘贴菜单）
      textSelectionColor: Colours.app_main.withAlpha(70),
      textSelectionHandleColor: Colours.app_main,
      textTheme: TextTheme(
          // TextField输入文字颜色
          subtitle1: isDarkMode ? TextStyles.textDark : TextStyles.text,
          // Text默认文字样式
          bodyText2: isDarkMode ? TextStyles.textDark : TextStyles.text,
          // 小文字样式
          subtitle2:
              isDarkMode ? TextStyles.textDarkGray12 : TextStyles.textGray12,
          caption:
              isDarkMode ? TextStyles.textDarkGray14 : TextStyles.textHint14),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle:
            isDarkMode ? TextStyles.textHint14 : TextStyles.textDarkGray14,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        color: isDarkMode ? Colours.dark_bg_color : Colors.red,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
      ),
      dividerTheme: DividerThemeData(
          color: isDarkMode ? Colours.dark_line : Colours.line,
          space: 0.6,
          thickness: 0.6),
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
      ),
      pageTransitionsTheme: NoTransitionsOnWeb(),
    );
  }
}
