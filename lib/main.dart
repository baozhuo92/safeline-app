import 'dart:io';
import 'package:flutter/material.dart';
import 'config/app_config.dart';
import 'pages/home_page.dart';
import 'pages/settings_page.dart';
import 'theme/app_colors.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import 'widgets/floating_bubbles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfig.instance.init();
  HttpOverrides.global = _DevHttpOverrides();
  runApp(const MyApp());
}

class _DevHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    final client = super.createHttpClient(context);
    if (AppConfig.instance.allowBadCert) {
      client.badCertificateCallback = (cert, host, port) => true;
    }
    return client;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: AppConfig.instance,
      builder: (context, _) {
        final config = AppConfig.instance;

        final tdLight = TDThemeData.defaultData().copyWithTDThemeData(
          'light',
          colorMap: {
            'brandColor7': AppColors.primary,
            'brandColor6': AppColors.primary400,
            'brandColor8': AppColors.primary600,
            'errorColor6': AppColors.danger,
            'successColor5': AppColors.success,
            'warningColor5': AppColors.warning,
          },
        );
        final tdDark = tdLight.copyWithTDThemeData('dark');

        return MaterialApp(
          title: 'SafeLine',
          debugShowCheckedModeBanner: false,
          themeMode: config.themeMode,

          theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.light,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primary,
              brightness: Brightness.light,
            ),
            scaffoldBackgroundColor: AppThemeColors.light.bgPageStart,
            cardColor: AppThemeColors.light.bgCard,
            dividerColor: AppThemeColors.light.border,
            extensions: [AppThemeColors.light, tdLight],
          ),

          darkTheme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primary,
              brightness: Brightness.dark,
            ),
            scaffoldBackgroundColor: AppThemeColors.dark.bgPageStart,
            cardColor: AppThemeColors.dark.bgCard,
            dividerColor: AppThemeColors.dark.border,
            extensions: [AppThemeColors.dark, tdDark],
          ),

          home: const MainShell(),
        );
      },
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final themeColors = AppThemeColors.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final pages = const <Widget>[HomePage(), SettingsPage()];

    return Scaffold(
      body: Stack(
        children: [
          // 背景渐变层
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  themeColors.bgPageStart,
                  themeColors.bgPageEnd,
                ],
              ),
            ),
          ),
          // 四角浮动装饰圆球（根据主题自动调整透明度）
          FloatingBubbles(isDark: isDark),
          // 页面内容
          IndexedStack(
            index: _currentIndex,
            children: pages,
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(isDark, themeColors),
    );
  }

  Widget _buildBottomNav(bool isDark, AppThemeColors tc) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: isDark
              ? const Color(0xFF1E293B).withAlpha(180)
              : Colors.white.withAlpha(180),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: isDark
                ? Colors.white.withAlpha(18)
                : Colors.white.withAlpha(200),
            width: 0.6,
          ),
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? Colors.black.withAlpha(60)
                  : Colors.black.withAlpha(16),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          bottom: false,
          child: Row(
            children: [
              _navTab(0, '首页', Icons.home_rounded, tc),
              _navTab(1, '设置', Icons.settings_rounded, tc),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navTab(int idx, String label, IconData icon, AppThemeColors tc) {
    final selected = _currentIndex == idx;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _currentIndex = idx),
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 280),
          curve: Curves.easeOutCubic,
          margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
          padding: const EdgeInsets.only(top: 6, bottom: 2),
          decoration: BoxDecoration(
            gradient: selected
                ? LinearGradient(
                    colors: [
                      AppColors.primary400,
                      AppColors.primary,
                      AppColors.primary600,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null,
            color: selected ? null : Colors.transparent,
            borderRadius: BorderRadius.circular(14),
            boxShadow: selected
                ? [
                    BoxShadow(
                      color: AppColors.primary.withAlpha(60),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 280),
                transitionBuilder: (child, anim) => ScaleTransition(
                  scale: anim,
                  child: child,
                ),
                child: Icon(
                  icon,
                  key: ValueKey('$idx-$selected'),
                  size: 20,
                  color: selected ? Colors.white : tc.tabUnselected,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  height: 1.0,
                  color: selected ? Colors.white : tc.tabUnselected,
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
