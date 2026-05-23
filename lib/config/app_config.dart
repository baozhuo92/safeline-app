import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfig extends ChangeNotifier {
  AppConfig._();
  static final AppConfig instance = AppConfig._();

  // ---- SharedPreferences keys ----
  static const _keyHost = 'host';
  static const _keyToken = 'token';
  static const _keyIsHttps = 'is_https';
  static const _keyThemeMode = 'theme_mode';

  // ---- 服务器配置 ----
  String _host = '';
  String get host => _host;

  String _token = '';
  String get token => _token;

  bool _isHttps = true;
  bool get isHttps => _isHttps;

  String get baseUrl => '${_isHttps ? 'https' : 'http'}://$_host';

  // ---- 主题 ----
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;
  bool get isDarkMode => _themeMode == ThemeMode.dark;

  // ---- 初始化：从本地存储加载（在 main() 中调用） ----
  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    _host = prefs.getString(_keyHost) ?? 'web.520527.xyz:54321/api/open';
    _token = prefs.getString(_keyToken) ??
        'Aumd.kp_9uP_0bywH5o-ouxNpLMNj2jD';
    _isHttps = prefs.getBool(_keyIsHttps) ?? true;
    _themeMode =
        prefs.getString(_keyThemeMode) == 'dark' ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  // ---- 内部：保存到本地存储 ----
  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_keyHost, _host);
    prefs.setString(_keyToken, _token);
    prefs.setBool(_keyIsHttps, _isHttps);
    prefs.setString(_keyThemeMode, _themeMode == ThemeMode.dark ? 'dark' : 'light');
  }

  // ---- 操作方法（可在事件回调中调用） ----
  void setServer(String host, String token) {
    _host = host;
    _token = token;
    _save();
    notifyListeners();
  }

  void setHttps(bool value) {
    _isHttps = value;
    _save();
    notifyListeners();
  }

  void toggleTheme() {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    _save();
    notifyListeners();
  }

  void closeHost() {
    _host = '';
    _save();
    notifyListeners();
  }

  void closeToken() {
    _token = '';
    _save();
    notifyListeners();
  }
}
