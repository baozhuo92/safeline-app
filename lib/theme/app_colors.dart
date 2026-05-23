import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ========== 品牌色（金色阶梯 — 专业/安全/品质） ==========
  static const Color primary50  = Color(0xFFFFFBEB);
  static const Color primary100 = Color(0xFFFEF3C7);
  static const Color primary200 = Color(0xFFFDE68A);
  static const Color primary300 = Color(0xFFFCD34D);
  static const Color primary400 = Color(0xFFFBBF24);
  static const Color primary     = Color(0xFFF59E0B);
  static const Color primary600 = Color(0xFFD97706);
  static const Color primary700 = Color(0xFFB45309);
  static const Color primary800 = Color(0xFF92400E);
  static const Color primary900 = Color(0xFF78350F);

  // ========== 强调色 ==========
  static const Color accentAmber = Color(0xFFF59E0B);
  static const Color accentWarm  = Color(0xFFD97706);
  static const Color accentDeep  = Color(0xFFB45309);

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

class GlassColors {
  GlassColors._();

  static Color glassSurface(bool isDark) =>
      isDark
          ? const Color(0xFF2D1F0E).withAlpha(140)
          : const Color(0xFFFFFFFF).withAlpha(200);

  static Color glassBorder(bool isDark) =>
      isDark
          ? const Color(0xFFFCD34D).withAlpha(14)
          : const Color(0xFFF59E0B).withAlpha(40);

  static Color glassHighlight(bool isDark) =>
      isDark
          ? const Color(0xFFFFFFFF).withAlpha(6)
          : const Color(0xFFFFFFFF).withAlpha(220);

  static Color glassShadow(bool isDark) =>
      isDark
          ? const Color(0xFF0C0701).withAlpha(200)
          : const Color(0xFFB45309).withAlpha(18);

  static Color glassNavBg(bool isDark) =>
      isDark
          ? const Color(0xFF1C1306).withAlpha(215)
          : const Color(0xFFFFFBEB).withAlpha(230);

  static Color glassNavBorder(bool isDark) =>
      isDark
          ? const Color(0xFFFCD34D).withAlpha(10)
          : const Color(0xFFFDE68A).withAlpha(160);
}

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

  // ===== 亮色 =====
  static const light = AppThemeColors(
    bgPageStart:     Color(0xFFFFFBF0),
    bgPageEnd:       Color(0xFFFFFBEB),
    bgCard:          Color(0xFFFFFFFF),
    border:          Color(0xFFE5E0D5),
    textMain:        Color(0xFF1C1917),
    textSecondary:   Color(0xFF57534E),
    textPlaceholder: Color(0xFFA8A29E),
    tabSelected:     Color(0xFFF59E0B),
    tabUnselected:   Color(0xFFA8A29E),
    tabSelectedBg:   Color(0xFFFEF3C7),
  );

  // ===== 暗色 =====
  static const dark = AppThemeColors(
    bgPageStart:     Color(0xFF1C1306),
    bgPageEnd:       Color(0xFF120C04),
    bgCard:          Color(0xFF2D1F0E),
    border:          Color(0xFF44403C),
    textMain:        Color(0xFFFAFAF9),
    textSecondary:   Color(0xFFA8A29E),
    textPlaceholder: Color(0xFF78716C),
    tabSelected:     Color(0xFFFBBF24),
    tabUnselected:   Color(0xFF78716C),
    tabSelectedBg:   Color(0xFF78350F),
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
