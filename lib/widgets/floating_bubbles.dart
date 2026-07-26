import 'package:flutter/material.dart';

/// 装饰性浮动渐变圆球
///
/// 在屏幕四个角落放置半透明渐变圆球，沿对角线缓慢漂移，
/// 营造梦幻柔和的背景氛围。根据亮暗主题自动调整透明度。
class FloatingBubbles extends StatefulWidget {
  final bool isDark;

  const FloatingBubbles({super.key, required this.isDark});

  @override
  State<FloatingBubbles> createState() => _FloatingBubblesState();
}

class _FloatingBubblesState extends State<FloatingBubbles>
    with TickerProviderStateMixin {
  late final List<AnimationController> _controllers;

  @override
  void initState() {
    super.initState();

    _controllers = List.generate(4, (i) {
      return AnimationController(
        vsync: this,
        duration: Duration(seconds: 18 + i * 7),
      )..repeat(reverse: true);
    });
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        clipBehavior: Clip.none,
        children: List.generate(4, (i) => _buildBubble(i)),
      ),
    );
  }

  Widget _buildBubble(int i) {
    final cfg = _kConfigs[i];
    final dark = widget.isDark;

    return AnimatedBuilder(
      animation: _controllers[i],
      builder: (context, _) {
        final t = _controllers[i].value;
        return Align(
          alignment: Alignment(
            cfg.alignStart.x + (cfg.alignEnd.x - cfg.alignStart.x) * t,
            cfg.alignStart.y + (cfg.alignEnd.y - cfg.alignStart.y) * t,
          ),
          child: Container(
            width: cfg.size,
            height: cfg.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: cfg.colors(dark),
                center: Alignment.topLeft,
              ),
            ),
          ),
        );
      },
    );
  }
}

// ==================== 圆球配置 ====================

class _BubbleConfig {
  final double size;
  final Alignment alignStart;
  final Alignment alignEnd;
  final List<Color> lightColors;
  final List<Color> darkColors;

  const _BubbleConfig({
    required this.size,
    required this.alignStart,
    required this.alignEnd,
    required this.lightColors,
    required this.darkColors,
  });

  List<Color> colors(bool isDark) => isDark ? darkColors : lightColors;
}

/// 四个圆球配置：尺寸、起始角落、漂移终点、渐变色
/// light: 亮色下 alpha 更高，确保浅背景可见
/// dark:  暗色下 alpha 低一些，避免喧宾夺主
const _kConfigs = [
  _BubbleConfig(
    size: 200,
    alignStart: Alignment(-0.85, -0.85),
    alignEnd: Alignment(-0.50, -0.55),
    lightColors: [Color(0x55C8E6FF), Color(0x18E6F0FF)],
    darkColors: [Color(0x30C8E6FF), Color(0x08E6F0FF)],
  ),
  _BubbleConfig(
    size: 160,
    alignStart: Alignment(0.85, -0.85),
    alignEnd: Alignment(0.55, -0.50),
    lightColors: [Color(0x55FFD6E6), Color(0x18FFE8F0)],
    darkColors: [Color(0x30FFD6E6), Color(0x08FFE8F0)],
  ),
  _BubbleConfig(
    size: 220,
    alignStart: Alignment(0.85, 0.85),
    alignEnd: Alignment(0.50, 0.55),
    lightColors: [Color(0x55D6FFE0), Color(0x18E8FFF0)],
    darkColors: [Color(0x30D6FFE0), Color(0x08E8FFF0)],
  ),
  _BubbleConfig(
    size: 140,
    alignStart: Alignment(-0.85, 0.85),
    alignEnd: Alignment(-0.55, 0.50),
    lightColors: [Color(0x55E6D6FF), Color(0x18F0E8FF)],
    darkColors: [Color(0x30E6D6FF), Color(0x08F0E8FF)],
  ),
];
