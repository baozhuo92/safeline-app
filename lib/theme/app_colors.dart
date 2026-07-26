import 'package:flutter/material.dart';

/// ZOLYSOFT 品牌设计系统色板（UI/UX Pro Max 规范）
///
/// 规范来源：UI/UX Pro Max
///   * 风格：Glassmorphism
///   * 品牌蓝：#2563EB
///   * 强调橙：#F97316
///   * 背景：#F8FAFC
///   * 前景：#1E293B
///   * 字体：Inter
///   * 效果：Backdrop blur 10-20px, 1px rgba white 0.2 border, Z-depth
class AppColors {
  AppColors._();

  // ========== 品牌色（蓝色阶梯） ==========
  static const Color primary50  = Color(0xFFEFF6FF);
  static const Color primary100 = Color(0xFFDBEAFE);
  static const Color primary200 = Color(0xFFBFDBFE);
  static const Color primary300 = Color(0xFF93C5FD);
  static const Color primary400 = Color(0xFF60A5FA);
  static const Color primary     = Color(0xFF2563EB);
  static const Color primary600 = Color(0xFF1D4ED8);
  static const Color primary700 = Color(0xFF1E40AF);
  static const Color primary800 = Color(0xFF1E3A5F);
  static const Color primary900 = Color(0xFF172554);

  // ========== 强调色（橙 — ZOLYSOFT CTA） ==========
  static const Color accent     = Color(0xFFF97316);
  static const Color accentLight = Color(0xFFFB923C);
  static const Color accentDeep  = Color(0xFFEA580C);

  // ========== 功能色 ==========
  static const Color success     = Color(0xFF10B981);
  static const Color successBg   = Color(0xFFECFDF5);
  static const Color successDeep = Color(0xFF059669);
  static const Color warning     = Color(0xFFF59E0B);
  static const Color warningBg   = Color(0xFFFFFBEB);
  static const Color warningDeep = Color(0xFFD97706);
  static const Color danger      = Color(0xFFEF4444);
  static const Color dangerBg    = Color(0xFFFEF2F2);
  static const Color dangerDeep  = Color(0xFFB91C1C);
  static const Color info        = Color(0xFF3B82F6);
  static const Color infoBg      = Color(0xFFEFF6FF);
  static const Color infoDeep    = Color(0xFF1D4ED8);

  // ========== 遮罩 ==========
  static const Color mask = Color(0x66000000);
}

/// 玻璃拟态颜色工厂（ZOLYSOFT Glassmorphism 规范）
class GlassColors {
  GlassColors._();

  static Color glassSurface(bool isDark) =>
      isDark
          ? const Color(0xFF1E293B).withAlpha(140)
          : const Color(0xFFFFFFFF).withAlpha(200);

  static Color glassBorder(bool isDark) =>
      isDark
          ? Colors.white.withAlpha(15)
          : Colors.white.withAlpha(200);

  static Color glassHighlight(bool isDark) =>
      isDark
          ? Colors.white.withAlpha(6)
          : Colors.white.withAlpha(220);

  static Color glassShadow(bool isDark) =>
      isDark
          ? const Color(0xFF020617).withAlpha(200)
          : const Color(0xFF2563EB).withAlpha(18);

  static Color glassNavBg(bool isDark) =>
      isDark
          ? const Color(0xFF0F172A).withAlpha(215)
          : const Color(0xFFEFF6FF).withAlpha(230);

  static Color glassNavBorder(bool isDark) =>
      isDark
          ? const Color(0xFF3B82F6).withAlpha(10)
          : const Color(0xFF2563EB).withAlpha(40);
}

/// 应用主题扩展色
class AppThemeColors extends ThemeExtension<AppThemeColors> {
  final Color bgPageStart;
  final Color bgPageEnd;
  final Color bgCard;
  final Color border;
  final Color textMain;
  final Color textSecondary;
  final Color textPlaceholder;
  final Color tabSelected;
  final Color tabUnselected;
  final Color tabSelectedBg;

  const AppThemeColors({
    required this.bgPageStart,
    required this.bgPageEnd,
    required this.bgCard,
    required this.border,
    required this.textMain,
    required this.textSecondary,
    required this.textPlaceholder,
    required this.tabSelected,
    required this.tabUnselected,
    required this.tabSelectedBg,
  });

  // ===== 亮色（Glassmorphism 清爽渐变） =====
  static const light = AppThemeColors(
    bgPageStart:     Color(0xFFF8FAFC),
    bgPageEnd:       Color(0xFFEFF6FF),
    bgCard:          Color(0xFFFFFFFF),
    border:          Color(0xFFE2E8F0),
    textMain:        Color(0xFF1E293B),
    textSecondary:   Color(0xFF475569),
    textPlaceholder: Color(0xFF94A3B8),
    tabSelected:     Color(0xFF2563EB),
    tabUnselected:   Color(0xFF94A3B8),
    tabSelectedBg:   Color(0xFFEFF6FF),
  );

  // ===== 暗色 =====
  static const dark = AppThemeColors(
    bgPageStart:     Color(0xFF0F172A),
    bgPageEnd:       Color(0xFF020617),
    bgCard:          Color(0xFF1E293B),
    border:          Color(0xFF334155),
    textMain:        Color(0xFFF8FAFC),
    textSecondary:   Color(0xFF94A3B8),
    textPlaceholder: Color(0xFF64748B),
    tabSelected:     Color(0xFF60A5FA),
    tabUnselected:   Color(0xFF64748B),
    tabSelectedBg:   Color(0xFF1E3A5F),
  );

  static AppThemeColors of(BuildContext context) =>
      Theme.of(context).extension<AppThemeColors>()!;

  @override
  AppThemeColors copyWith({
    Color? bgPageStart,
    Color? bgPageEnd,
    Color? bgCard,
    Color? border,
    Color? textMain,
    Color? textSecondary,
    Color? textPlaceholder,
    Color? tabSelected,
    Color? tabUnselected,
    Color? tabSelectedBg,
  }) {
    return AppThemeColors(
      bgPageStart:    bgPageStart ?? this.bgPageStart,
      bgPageEnd:      bgPageEnd ?? this.bgPageEnd,
      bgCard:         bgCard ?? this.bgCard,
      border:         border ?? this.border,
      textMain:       textMain ?? this.textMain,
      textSecondary:  textSecondary ?? this.textSecondary,
      textPlaceholder:textPlaceholder ?? this.textPlaceholder,
      tabSelected:    tabSelected ?? this.tabSelected,
      tabUnselected:  tabUnselected ?? this.tabUnselected,
      tabSelectedBg:  tabSelectedBg ?? this.tabSelectedBg,
    );
  }

  @override
  AppThemeColors lerp(AppThemeColors other, double t) {
    return AppThemeColors(
      bgPageStart:    Color.lerp(bgPageStart, other.bgPageStart, t)!,
      bgPageEnd:      Color.lerp(bgPageEnd, other.bgPageEnd, t)!,
      bgCard:         Color.lerp(bgCard, other.bgCard, t)!,
      border:         Color.lerp(border, other.border, t)!,
      textMain:       Color.lerp(textMain, other.textMain, t)!,
      textSecondary:  Color.lerp(textSecondary, other.textSecondary, t)!,
      textPlaceholder:Color.lerp(textPlaceholder, other.textPlaceholder, t)!,
      tabSelected:    Color.lerp(tabSelected, other.tabSelected, t)!,
      tabUnselected:  Color.lerp(tabUnselected, other.tabUnselected, t)!,
      tabSelectedBg:  Color.lerp(tabSelectedBg, other.tabSelectedBg, t)!,
    );
  }
}
