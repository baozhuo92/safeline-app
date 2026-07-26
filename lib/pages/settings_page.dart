import 'dart:ui';
import 'package:flutter/material.dart';
import '../config/app_config.dart';
import '../theme/app_colors.dart';
import '../widgets/app_navbar.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

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
              _SettingsRow(
                title: '雷池服务器',
                subtitle: config.host.isNotEmpty
                    ? '${config.isHttps ? "https" : "http"}://${config.host}'
                    : '未配置',
                trailing: _chevron(context),
                onTap: () => _openServerConfig(context),
              ),
            ],
          ),

          const SizedBox(height: 14),

          _buildGlassSection(
            isDark: isDark,
            title: '通知',
            icon: Icons.notifications_outlined,
            children: [
              _SettingsRow(
                title: '接收推送通知',
                subtitle: '开启后将收到活动提醒',
                trailing: TDSwitch(
                  isOn: _notificationsOn,
                  size: TDSwitchSize.medium,
                  trackOnColor: AppColors.primary,
                  onChanged: (v) {
                    setState(() => _notificationsOn = v);
                    return true;
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          _buildGlassSection(
            isDark: isDark,
            title: '外观',
            icon: Icons.palette_outlined,
            children: [
              _SettingsRow(
                title: '深色模式',
                subtitle: config.isDarkMode ? '当前为暗色主题' : '当前为亮色主题',
                trailing: TDSwitch(
                  isOn: config.isDarkMode,
                  size: TDSwitchSize.medium,
                  trackOnColor: AppColors.primary,
                  onChanged: (_) {
                    config.toggleTheme();
                    return true;
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          _buildGlassSection(
            isDark: isDark,
            title: '关于',
            icon: Icons.info_outline,
            children: [
              _SettingsRow(
                title: '版本号',
                trailing: Text(
                  'v1.0.0',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppThemeColors.of(context).textSecondary,
                  ),
                ),
                showDivider: true,
              ),
              _SettingsRow(
                title: '隐私政策',
                trailing: _chevron(context),
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
          padding: const EdgeInsets.only(left: 4, bottom: 10),
          child: Row(
            children: [
              Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.primary400, AppColors.primary600],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(7),
                ),
                alignment: Alignment.center,
                child: Icon(icon, size: 14, color: Colors.white),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppThemeColors.of(context).textSecondary,
                ),
              ),
            ],
          ),
        ),
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 28, sigmaY: 28),
              child: Container(
                decoration: BoxDecoration(
                  color: GlassColors.glassSurface(isDark),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: GlassColors.glassBorder(isDark),
                    width: 0.8,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFB8CCFF).withAlpha(30),
                      blurRadius: 32,
                      offset: const Offset(0, 14),
                    ),
                    BoxShadow(
                      color: GlassColors.glassShadow(isDark),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                    BoxShadow(
                      color: Colors.white.withAlpha(40),
                      blurRadius: 4,
                      offset: const Offset(0, -1),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 4),
                    ...children,
                    const SizedBox(height: 4),
                  ],
                ),
              ),
            ),
          ),
      ],
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
        pageBuilder: (context, animation, secondaryAnimation) => const _ServerConfigSheet(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
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

  Icon _chevron(BuildContext context) {
    return Icon(
      Icons.chevron_right_rounded,
      size: 20,
      color: AppThemeColors.of(context).textPlaceholder,
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
  late bool _allowBadCert;

  @override
  void initState() {
    super.initState();
    final cfg = AppConfig.instance;
    _hostController = TextEditingController(text: cfg.host);
    _tokenController = TextEditingController(text: cfg.token);
    _isHttps = cfg.isHttps;
    _allowBadCert = cfg.allowBadCert;
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
    cfg.setAllowBadCert(_allowBadCert);
    if (mounted) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('服务器配置已保存'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
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
                  filter: ImageFilter.blur(sigmaX: 32, sigmaY: 32),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isDark
                          ? const Color(0xFF1E293B).withAlpha(240)
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
                              TDInput(
                                leftLabel: _isHttps ? 'https://' : 'http://',
                                hintText: '服务器地址',
                                controller: _hostController,
                                needClear: true,
                                onClearTap: () {
                                  AppConfig.instance.closeHost();
                                  _hostController.clear();
                                },
                              ),
                              const SizedBox(height: 12),
                              TDInput(
                                leftLabel: 'Token',
                                hintText: '服务器Token',
                                controller: _tokenController,
                                needClear: true,
                                onClearTap: () {
                                  AppConfig.instance.closeToken();
                                  _tokenController.clear();
                                },
                              ),
                              const SizedBox(height: 14),
                              _buildHttpsSwitch(isDark: isDark),
                              const SizedBox(height: 14),
                              _buildAllowBadCertSwitch(isDark: isDark),
                              const SizedBox(height: 14),
                              SizedBox(
                                width: double.infinity,
                                child: TDButton(
                                  text: '保存配置',
                                  size: TDButtonSize.large,
                                  type: TDButtonType.fill,
                                  shape: TDButtonShape.round,
                                  isBlock: true,
                                  onTap: _save,
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
        TDSwitch(
          isOn: _isHttps,
          size: TDSwitchSize.small,
          trackOnColor: AppColors.primary,
          onChanged: (v) {
            setState(() => _isHttps = v);
            return true;
          },
        ),
      ],
    );
  }

  Widget _buildAllowBadCertSwitch({required bool isDark}) {
    final themeColors = AppThemeColors.of(context);
    return Row(
      children: [
        Icon(
          Icons.shield_outlined,
          size: 16,
          color: _allowBadCert ? AppColors.warning : themeColors.textPlaceholder,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '跳过 SSL 证书验证',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: themeColors.textMain,
                ),
              ),
              Text(
                '允许自签名证书（仅用于自建服务器）',
                style: TextStyle(
                  fontSize: 11,
                  color: themeColors.textPlaceholder,
                ),
              ),
            ],
          ),
        ),
        TDSwitch(
          isOn: _allowBadCert,
          size: TDSwitchSize.small,
          trackOnColor: AppColors.warning,
          onChanged: (v) {
            setState(() => _allowBadCert = v);
            return true;
          },
        ),
      ],
    );
  }
}

/// 统一设置行组件（所有列表项使用同一套间距和字号标准）
class _SettingsRow extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool showDivider;

  const _SettingsRow({
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.showDivider = false,
  });

  @override
  Widget build(BuildContext context) {
    final tc = AppThemeColors.of(context);

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: showDivider
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: GlassColors.glassBorder(Theme.of(context).brightness == Brightness.dark),
                    width: 0.5,
                  ),
                ),
              )
            : null,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: tc.textMain,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle!,
                      style: TextStyle(
                        fontSize: 12,
                        color: tc.textSecondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
            if (trailing != null) ...[
              const SizedBox(width: 12),
              trailing!,
            ],
          ],
        ),
      ),
    );
  }
}
