import 'dart:ui';
import 'package:flutter/material.dart';
import 'config/app_config.dart';
import 'pages/home_page.dart';
import 'pages/settings_page.dart';
import 'theme/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfig.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: AppConfig.instance,
      builder: (context, _) {
        final config = AppConfig.instance;
        return MaterialApp(
          title: 'SafeLine',
          debugShowCheckedModeBanner: false,
          themeMode: config.themeMode,

          theme: ThemeData(
            brightness: Brightness.light,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primary,
              brightness: Brightness.light,
            ),
            scaffoldBackgroundColor: AppThemeColors.light.bgPageStart,
            cardColor: AppThemeColors.light.bgCard,
            dividerColor: AppThemeColors.light.border,
            extensions: [AppThemeColors.light],
          ),

          darkTheme: ThemeData(
            brightness: Brightness.dark,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primary,
              brightness: Brightness.dark,
            ),
            scaffoldBackgroundColor: AppThemeColors.dark.bgPageStart,
            cardColor: AppThemeColors.dark.bgCard,
            dividerColor: AppThemeColors.dark.border,
            extensions: [AppThemeColors.dark],
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
      body: Container(
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
        child: IndexedStack(
          index: _currentIndex,
          children: pages,
        ),
      ),
      bottomNavigationBar: _buildGlassNav(isDark, themeColors),
    );
  }

  Widget _buildGlassNav(bool isDark, AppThemeColors themeColors) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          decoration: BoxDecoration(
            color: GlassColors.glassNavBg(isDark),
            border: Border(
              top: BorderSide(
                color: GlassColors.glassNavBorder(isDark),
                width: 0.5,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: GlassColors.glassShadow(isDark),
                blurRadius: 16,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  _navTab(0, '首页', Icons.home_outlined, Icons.home, themeColors),
                  _navTab(1, '设置', Icons.settings_outlined, Icons.settings, themeColors),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _navTab(int idx, String label, IconData iconOutlined, IconData iconFilled, AppThemeColors tc) {
    final selected = _currentIndex == idx;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _currentIndex = idx),
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(vertical: 8),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: selected
                ? tc.tabSelectedBg.withAlpha(isDark ? 180 : 160)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(14),
            border: selected
                ? Border.all(
                    color: isDark
                        ? tc.tabSelected.withAlpha(100)
                        : tc.tabSelected.withAlpha(50),
                    width: 0.5,
                  )
                : null,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                selected ? iconFilled : iconOutlined,
                size: 22,
                color: selected ? tc.tabSelected : tc.tabUnselected,
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                  color: selected ? tc.tabSelected : tc.tabUnselected,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
