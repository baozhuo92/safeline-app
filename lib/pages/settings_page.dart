import 'dart:ui';
import 'package:flutter/material.dart';
import '../config/app_config.dart';
import '../theme/app_colors.dart';
import '../widgets/app_navbar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsOn = true;

  @override
  Widget build(BuildContext context) {
    final config = AppConfig.instance;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppNavbar(title: ''),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          _buildGlassSection(
            isDark: isDark,
            title: '服务器配置',
            icon: Icons.dns_outlined,
            children: [
              _glassListTile(
                isDark: isDark,
                label: '雷池服务器',
                subtitle: config.host.isNotEmpty
                    ? '${config.isHttps ? "https" : "http"}://${config.host}'
                    : '未配置',
                trailing: const Icon(Icons.chevron_right_rounded, size: 20),
                onTap: () => _openServerConfig(context),
              ),
            ],
          ),

          const SizedBox(height: 12),

          _buildGlassSection(
            isDark: isDark,
            title: '通知',
            icon: Icons.notifications_outlined,
            children: [
              _glassSwitchTile(
                isDark: isDark,
                label: '接收推送通知',
                subtitle: '开启后将收到活动提醒',
                value: _notificationsOn,
                onChanged: (v) => setState(() => _notificationsOn = v),
              ),
            ],
          ),

          const SizedBox(height: 12),

          _buildGlassSection(
            isDark: isDark,
            title: '外观',
            icon: Icons.palette_outlined,
            children: [
              _glassSwitchTile(
                isDark: isDark,
                label: '深色模式',
                subtitle: config.isDarkMode ? '当前为暗色主题' : '当前为亮色主题',
                value: config.isDarkMode,
                onChanged: (_) => config.toggleTheme(),
              ),
            ],
          ),

          const SizedBox(height: 12),

          _buildGlassSection(
            isDark: isDark,
            title: '关于',
            icon: Icons.info_outline,
            children: [
              _glassListTile(
                isDark: isDark,
                label: '版本号',
                subtitle: 'v1.0.0',
                showArrow: false,
              ),
              Divider(
                height: 1,
                color: GlassColors.glassBorder(isDark),
                indent: 14,
                endIndent: 14,
              ),
              _glassListTile(
                isDark: isDark,
                label: '隐私政策',
                trailing: const Icon(Icons.chevron_right_rounded, size: 20),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('隐私政策页面'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
              ),
            ],
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildGlassSection({
    required bool isDark,
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Row(
            children: [
              Icon(icon, size: 15, color: AppColors.primary400),
              const SizedBox(width: 6),
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppThemeColors.of(context).textSecondary,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
            child: Container(
              decoration: BoxDecoration(
                color: GlassColors.glassSurface(isDark),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: GlassColors.glassBorder(isDark),
                  width: 0.6,
                ),
                boxShadow: [
                  BoxShadow(
                    color: GlassColors.glassShadow(isDark),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(children: children),
            ),
          ),
        ),
      ],
    );
  }

  Widget _glassListTile({
    required bool isDark,
    required String label,
    String? subtitle,
    Widget? trailing,
    bool showArrow = true,
    VoidCallback? onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppThemeColors.of(context).textMain,
                      ),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 3),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 12,
                          color: AppThemeColors.of(context).textPlaceholder,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (trailing != null)
                trailing
              else if (showArrow)
                Icon(
                  Icons.chevron_right_rounded,
                  size: 20,
                  color: AppThemeColors.of(context).textPlaceholder,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _glassSwitchTile({
    required bool isDark,
    required String label,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    final themeColors = AppThemeColors.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: themeColors.textMain,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: themeColors.textPlaceholder,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          _buildGlassToggle(value, onChanged),
        ],
      ),
    );
  }

  Widget _buildGlassToggle(bool value, ValueChanged<bool> onChanged) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        width: 42,
        height: 26,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: value
              ? AppColors.primary.withAlpha(200)
              : Colors.white.withAlpha(15),
          border: Border.all(
            color: value
                ? AppColors.primary.withAlpha(60)
                : Colors.white.withAlpha(20),
            width: 0.5,
          ),
          boxShadow: value
              ? [
                  BoxShadow(
                    color: AppColors.primary.withAlpha(40),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Stack(
          children: [
            AnimatedAlign(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutCubic,
              alignment: value ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(30),
                      blurRadius: 3,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openServerConfig(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        transitionDuration: const Duration(milliseconds: 350),
        reverseTransitionDuration: const Duration(milliseconds: 300),
        barrierDismissible: true,
        barrierColor: AppColors.mask,
        pageBuilder: (_, _, _) => const _ServerConfigSheet(),
        transitionsBuilder: (_, animation, _, child) {
          return SlideTransition(
            position: Tween(begin: const Offset(0, 1), end: Offset.zero)
                .animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeOutCubic,
                  ),
                ),
            child: FadeTransition(opacity: animation, child: child),
          );
        },
      ),
    );
  }
}

class _ServerConfigSheet extends StatefulWidget {
  const _ServerConfigSheet();

  @override
  State<_ServerConfigSheet> createState() => _ServerConfigSheetState();
}

class _ServerConfigSheetState extends State<_ServerConfigSheet> {
  late final TextEditingController _hostController;
  late final TextEditingController _tokenController;
  late bool _isHttps;

  @override
  void initState() {
    super.initState();
    final cfg = AppConfig.instance;
    _hostController = TextEditingController(text: cfg.host);
    _tokenController = TextEditingController(text: cfg.token);
    _isHttps = cfg.isHttps;
  }

  @override
  void dispose() {
    _hostController.dispose();
    _tokenController.dispose();
    super.dispose();
  }

  void _save() {
    final cfg = AppConfig.instance;
    cfg.setServer(_hostController.text.trim(), _tokenController.text.trim());
    cfg.setHttps(_isHttps);
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('服务器配置已保存'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final themeColors = AppThemeColors.of(context);

    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            color: Colors.transparent,
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {},
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(22),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isDark
                          ? const Color(0xFF2D1F0E).withAlpha(240)
                          : const Color(0xFFFFFFFF).withAlpha(235),
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(22),
                      ),
                      border: Border(
                        top: BorderSide(
                          color: GlassColors.glassBorder(isDark),
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 8),
                        Container(
                          width: 36,
                          height: 4,
                          decoration: BoxDecoration(
                            color: themeColors.textPlaceholder.withAlpha(60),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '雷池服务器配置',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: themeColors.textMain,
                          ),
                        ),
                        const SizedBox(height: 20),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              _glassInput(
                                isDark: isDark,
                                prefix: _isHttps ? 'https://' : 'http://',
                                hint: '服务器地址',
                                controller: _hostController,
                                onClear: () {
                                  AppConfig.instance.closeHost();
                                  _hostController.clear();
                                },
                              ),
                              const SizedBox(height: 12),
                              _glassInput(
                                isDark: isDark,
                                prefix: 'Token ',
                                hint: '服务器Token',
                                controller: _tokenController,
                                onClear: () {
                                  AppConfig.instance.closeToken();
                                  _tokenController.clear();
                                },
                              ),
                              const SizedBox(height: 14),
                              _buildHttpsSwitch(isDark: isDark),
                              const SizedBox(height: 14),
                              SizedBox(
                                width: double.infinity,
                                child: GestureDetector(
                                  onTap: _save,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 14,
                                    ),
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          AppColors.primary600,
                                          AppColors.primary400,
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColors.primary.withAlpha(
                                            50,
                                          ),
                                          blurRadius: 12,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      '保存配置',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _glassInput({
    required bool isDark,
    required String prefix,
    required String hint,
    required TextEditingController controller,
    required VoidCallback onClear,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: isDark
                ? Colors.white.withAlpha(8)
                : Colors.black.withAlpha(5),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: GlassColors.glassBorder(isDark),
              width: 0.5,
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Text(
                  prefix,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppThemeColors.of(context).textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: controller,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppThemeColors.of(context).textMain,
                  ),
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: TextStyle(
                      color: AppThemeColors.of(context).textPlaceholder,
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 13,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: onClear,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.close_rounded,
                    size: 18,
                    color: AppThemeColors.of(context).textPlaceholder,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHttpsSwitch({required bool isDark}) {
    final themeColors = AppThemeColors.of(context);
    return Row(
      children: [
        Icon(
          Icons.lock_outline,
          size: 16,
          color: _isHttps ? AppColors.success : themeColors.textPlaceholder,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            '启用 HTTPS',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: themeColors.textMain,
            ),
          ),
        ),
        _buildGlassToggle(_isHttps, (v) => setState(() => _isHttps = v)),
      ],
    );
  }

  Widget _buildGlassToggle(bool value, ValueChanged<bool> onChanged) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        width: 42,
        height: 26,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: value
              ? AppColors.primary.withAlpha(200)
              : Colors.white.withAlpha(15),
          border: Border.all(
            color: value
                ? AppColors.primary.withAlpha(60)
                : Colors.white.withAlpha(20),
            width: 0.5,
          ),
          boxShadow: value
              ? [
                  BoxShadow(
                    color: AppColors.primary.withAlpha(40),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Stack(
          children: [
            AnimatedAlign(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutCubic,
              alignment: value ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(30),
                      blurRadius: 3,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
