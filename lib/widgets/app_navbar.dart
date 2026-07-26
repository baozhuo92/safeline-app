import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AppNavbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData? leftIcon;
  final VoidCallback? onLeftTap;
  final IconData? rightIcon;
  final VoidCallback? onRightTap;

  const AppNavbar({
    super.key,
    required this.title,
    this.leftIcon,
    this.onLeftTap,
    this.rightIcon,
    this.onRightTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            color: GlassColors.glassNavBg(isDark),
            border: Border(
              bottom: BorderSide(
                color: GlassColors.glassBorder(isDark),
                width: 0.5,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: GlassColors.glassShadow(isDark),
                blurRadius: 12,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: SafeArea(
            bottom: false,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 2,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.primary400,
                          AppColors.primary,
                          AppColors.primary600,
                        ],
                      ),
                    ),
                  ),
                ),

                Row(
                  children: [
                    if (leftIcon != null)
                      _iconBtn(
                        icon: leftIcon!,
                        color: AppThemeColors.of(context).textMain,
                        onTap: onLeftTap,
                      )
                    else
                      const SizedBox(width: 8),

                    Expanded(
                      child: Center(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: AppThemeColors.of(context).textMain,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ),
                    ),

                    if (rightIcon != null)
                      _iconBtn(
                        icon: rightIcon!,
                        color: AppThemeColors.of(context).textSecondary,
                        onTap: onRightTap,
                      )
                    else
                      const SizedBox(width: 8),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _iconBtn({
    required IconData icon,
    required Color color,
    VoidCallback? onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(icon, size: 22, color: color),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
