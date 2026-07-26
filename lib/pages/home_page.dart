import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../config/app_config.dart';
import '../theme/app_colors.dart';
import '../utils/api_client.dart';
import '../widgets/app_navbar.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> _sites = [];
  bool _loading = true;
  String? _error;
  int? _selectedMode;
  final Set<int> _togglingIds = {};

  final ScrollController _scrollController = ScrollController();
  bool _showBackTop = false;

  late ApiClient _api;

  @override
  void initState() {
    super.initState();
    _createApiClient();
    AppConfig.instance.addListener(_onConfigChanged);
    _fetchSites();
    _scrollController.addListener(() {
      final shouldShow = _scrollController.offset >= 200;
      if (shouldShow != _showBackTop) {
        setState(() => _showBackTop = shouldShow);
      }
    });
  }

  void _createApiClient() {
    _api = ApiClient(
      baseUrl: AppConfig.instance.baseUrl,
      token: AppConfig.instance.token,
    );
  }

  void _onConfigChanged() {
    _api.dispose();
    _createApiClient();
  }

  @override
  void dispose() {
    AppConfig.instance.removeListener(_onConfigChanged);
    _scrollController.dispose();
    _api.dispose();
    super.dispose();
  }

  Future<void> _fetchSites() async {
    final response = await _api.get('/site');

    if (response.isSuccess) {
      setState(() {
        List<dynamic>? list;
        final data = response.data;
        if (data is List) {
          list = data;
        } else if (data is Map) {
          list =
              (data['data'] ?? data['list'] ?? data['items'] ?? [])
                  as List<dynamic>;
        }
        _sites = list ?? [];
        _loading = false;
      });
    } else {
      setState(() {
        _error = response.msg ?? '请求失败：${response.statusCode}';
        _loading = false;
      });
    }
  }

  Future<void> _toggleSiteMode(Map<String, dynamic> site) async {
    final id = site['id'] as int?;
    if (id == null) return;
    final currentMode = site['mode'] as int? ?? 0;
    final newMode = currentMode == 0 ? 1 : 0;

    setState(() => _togglingIds.add(id));
    final response = await _api.put(
      '/site/mode',
      body: {
        'ids': [id],
        'mode': newMode,
      },
    );
    if (response.isSuccess) {
      setState(() => _togglingIds.remove(id));
      await _fetchSites();
    } else {
      setState(() => _togglingIds.remove(id));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppNavbar(
        title: '',
        rightIcon: Icons.refresh,
        onRightTap: () {
          setState(() {
            _loading = true;
            _error = null;
          });
          _fetchSites();
        },
      ),
      body: _buildBody(),
    );
  }

  // ========== 骨架屏 ==========

  Widget _buildSkeleton() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final base = isDark ? const Color(0xFF1E293B) : const Color(0xFFF1F5F9);
    final shimmer = isDark ? const Color(0xFF273548) : const Color(0xFFE2E8F0);

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) => _ShimmerCard(
        key: ValueKey('skeleton_$index'),
        base: base,
        shimmer: shimmer,
      ),
    );
  }

  // ========== 主构建 ==========

  Widget _buildBody() {
    if (_loading) return _buildSkeleton();

    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: AppColors.dangerBg,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.cloud_off_rounded,
                  size: 32,
                  color: AppColors.danger,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                _error!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: AppThemeColors.of(context).textSecondary,
                ),
              ),
              const SizedBox(height: 24),
              _GlassBtn(
                label: '重试',
                icon: Icons.refresh,
                onTap: () {
                  setState(() {
                    _loading = true;
                    _error = null;
                  });
                  _fetchSites();
                },
              ),
            ],
          ),
        ),
      );
    }

    if (_sites.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.inventory_2_outlined,
              size: 48,
              color: AppThemeColors.of(context).textPlaceholder,
            ),
            const SizedBox(height: 14),
            Text(
              '暂无站点数据',
              style: TextStyle(
                fontSize: 15,
                color: AppThemeColors.of(context).textSecondary,
              ),
            ),
          ],
        ),
      );
    }

    final filtered = _selectedMode == null
        ? _sites
        : _sites
              .where((s) => (s['mode'] as int? ?? 0) == _selectedMode)
              .toList();

    return Stack(
      children: [
        Column(
          children: [
            _buildTabRow(),
            Expanded(
              child: filtered.isEmpty
                  ? Center(
                      child: Text(
                        '该模式下暂无站点',
                        style: TextStyle(
                          color: AppThemeColors.of(context).textSecondary,
                        ),
                      ),
                    )
                  : RefreshIndicator(
                      color: AppColors.primary,
                      onRefresh: _fetchSites,
                      child: ListView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        itemCount: filtered.length + 1,
                        itemBuilder: (context, index) {
                          if (index == filtered.length) {
                            return const SizedBox(height: 24);
                          }
                          return _AnimatedEntry(
                            index: index,
                            child: _SiteCard(
                              site: filtered[index],
                              isTogglingIds: _togglingIds,
                              onToggle: _toggleSiteMode,
                            ),
                          );
                        },
                      ),
                    ),
            ),
          ],
        ),
        // 回到顶部按钮
        if (_showBackTop)
          Positioned(
            right: 16,
            bottom: 24,
            child: _GlassBtn(
              label: '',
              icon: Icons.arrow_upward_rounded,
              size: 44,
              shape: BoxShape.circle,
              onTap: () => _scrollController.animateTo(
                0,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOutCubic,
              ),
            ),
          ),
      ],
    );
  }

  // ========== Tab 栏（简洁版） ==========

  Widget _buildTabRow() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    const tabs = [
      {'label': '全部', 'mode': null},
      {'label': '防御', 'mode': 0},
      {'label': '维护', 'mode': 1},
      {'label': '观察', 'mode': 2},
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
      child: Row(
        children: tabs.map((tab) {
          final mode = tab['mode'] as int?;
          final selected = _selectedMode == mode;
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: GestureDetector(
                onTap: () => setState(() => _selectedMode = mode),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  curve: Curves.easeOutCubic,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: selected
                        ? AppColors.primary
                        : (isDark
                            ? Colors.white.withAlpha(8)
                            : Colors.black.withAlpha(4)),
                    borderRadius: BorderRadius.circular(20),
                    border: selected
                        ? null
                        : Border.all(
                            color: isDark
                                ? Colors.white.withAlpha(10)
                                : Colors.black.withAlpha(8),
                          ),
                    boxShadow: selected
                        ? [
                            BoxShadow(
                              color: AppColors.primary.withAlpha(60),
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ]
                        : null,
                  ),
                  child: Text(
                    tab['label'] as String,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                      color: selected
                          ? Colors.white
                          : AppThemeColors.of(context).textSecondary,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// ======================================================================
//  站点卡片（独立组件，精简层级）
// ======================================================================

class _SiteCard extends StatelessWidget {
  final Map<String, dynamic> site;
  final Set<int> isTogglingIds;
  final Future<void> Function(Map<String, dynamic>) onToggle;

  const _SiteCard({
    required this.site,
    required this.isTogglingIds,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final themeColors = AppThemeColors.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final id = site['id'] as int?;
    final title = site['title']?.toString() ?? '未命名';
    final serverNames =
        (site['server_names'] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList() ?? [];
    final ports =
        (site['ports'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [];
    final upstreams =
        (site['upstreams'] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList() ?? [];

    final mode = site['mode'] as int? ?? 0;
    final modeLabel = {0: '防御', 1: '维护', 2: '观察'}[mode] ?? '未知';
    final modeColor =
        {0: AppColors.success, 1: AppColors.warning, 2: AppColors.info}[mode] ??
            AppColors.danger;

    final iconBase64 = site['icon']?.toString();
    final showSwitch = mode == 0 || mode == 1;
    final isToggling = id != null && isTogglingIds.contains(id);

    final urls = _buildUrls(serverNames, ports);

    final borderTint = modeColor.withAlpha(isDark ? 30 : 50);

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
          child: Container(
            decoration: BoxDecoration(
              color: GlassColors.glassSurface(isDark),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: borderTint, width: 0.8),
              boxShadow: [
                BoxShadow(
                  color: modeColor.withAlpha(isDark ? 8 : 14),
                  blurRadius: 32,
                  offset: const Offset(0, 16),
                ),
                BoxShadow(
                  color: GlassColors.glassShadow(isDark),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 头部：头像 + 标题 + 开关
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _Avatar(iconBase64: iconBase64, title: title),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: themeColors.textMain,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 5),
                            _ModeBadge(label: modeLabel, color: modeColor),
                          ],
                        ),
                      ),
                      if (showSwitch)
                        TDSwitch(
                          isOn: mode == 0,
                          enable: !isToggling,
                          size: TDSwitchSize.small,
                          trackOnColor: AppColors.primary,
                          onChanged: (_) {
                            if (!isToggling) onToggle(site);
                            return true;
                          },
                        ),
                    ],
                  ),

                  // URL 列表
                  if (urls.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    Divider(
                      height: 1,
                      color: GlassColors.glassBorder(isDark),
                    ),
                    const SizedBox(height: 10),
                    ...urls.map(
                      (url) => Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: GestureDetector(
                          onTap: () {
                            Clipboard.setData(ClipboardData(text: url));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('已复制: $url'),
                                duration: const Duration(seconds: 1),
                                behavior: SnackBarBehavior.floating,
                                width: 300,
                              ),
                            );
                          },
                          child: Text(
                            url,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.primary400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],

                  // 上游服务器
                  if (upstreams.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      '上游：${upstreams.join(", ")}',
                      style: TextStyle(
                        fontSize: 12,
                        color: themeColors.textPlaceholder,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<String> _buildUrls(List<String> serverNames, List<String> ports) {
    final httpPorts = ports.where((p) => p != '443').toList();
    final hasHttps = ports.any((p) => p == '443');

    final urls = <String>[];
    for (final domain in serverNames) {
      for (final port in httpPorts) {
        if (port.contains('ssl')) {
          final sslPort = port.replaceAll('_ssl', '');
          urls.add('https://$domain:$sslPort');
        } else {
          urls.add('http://$domain:$port');
        }
      }
      if (hasHttps) {
        urls.add('https://$domain');
      }
    }
    if (ports.isEmpty) {
      for (final domain in serverNames) {
        urls.add('http://$domain');
        urls.add('https://$domain');
      }
    }
    return urls;
  }
}

// ======================================================================
//  子组件
// ======================================================================

class _Avatar extends StatelessWidget {
  final String? iconBase64;
  final String title;

  const _Avatar({required this.iconBase64, required this.title});

  @override
  Widget build(BuildContext context) {
    Widget? image;
    final rawBase64 = iconBase64;
    if (rawBase64 != null && rawBase64.isNotEmpty) {
      try {
        String raw = rawBase64;
        if (raw.contains(',')) raw = raw.split(',').last;
        final bytes = base64Decode(raw);
        image = Image.memory(
          bytes,
          width: 44,
          height: 44,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => _fallback(),
        );
      } catch (_) {
        image = _fallback();
      }
    } else {
      image = _fallback();
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(11),
      child: SizedBox(width: 44, height: 44, child: image),
    );
  }

  Widget _fallback() {
    final letter = title.isNotEmpty ? title.characters.first : '?';
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary400, AppColors.primary600],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        letter,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _ModeBadge extends StatelessWidget {
  final String label;
  final Color color;

  const _ModeBadge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withAlpha(18),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withAlpha(40), width: 0.5),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}

// ======================================================================
//  通用毛玻璃按钮
// ======================================================================

class _GlassBtn extends StatelessWidget {
  final String label;
  final IconData icon;
  final double? size;
  final BoxShape? shape;
  final VoidCallback onTap;

  const _GlassBtn({
    required this.label,
    required this.icon,
    this.size,
    this.shape,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final s = size ?? 44;
    final isCircle = shape == BoxShape.circle;

    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: isCircle ? BorderRadius.circular(s / 2) : BorderRadius.circular(14),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
          child: Container(
            width: s,
            height: s,
            decoration: BoxDecoration(
              shape: shape ?? BoxShape.rectangle,
              color: isCircle
                  ? AppColors.primary.withAlpha(140)
                  : AppColors.primary.withAlpha(20),
              border: Border.all(
                color: isCircle
                    ? Colors.white.withAlpha(30)
                    : AppColors.primary.withAlpha(40),
                width: 0.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withAlpha(isCircle ? 40 : 20),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: isCircle
                ? Icon(icon, color: Colors.white, size: 22)
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(icon, size: 16, color: AppColors.primary),
                        const SizedBox(width: 6),
                        Text(
                          label,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

// ======================================================================
//  骨架屏卡片
// ======================================================================

class _ShimmerCard extends StatefulWidget {
  final Color base;
  final Color shimmer;

  const _ShimmerCard({
    super.key,
    required this.base,
    required this.shimmer,
  });

  @override
  State<_ShimmerCard> createState() => _ShimmerCardState();
}

class _ShimmerCardState extends State<_ShimmerCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: AnimatedBuilder(
        animation: _ctrl,
        builder: (context, _) {
          final t = _ctrl.value;
          return Container(
            height: 96,
            decoration: BoxDecoration(
              color: Color.lerp(widget.base, widget.shimmer, t),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 44, height: 44,
                  decoration: BoxDecoration(
                    color: Color.lerp(widget.shimmer, widget.base, t),
                    borderRadius: BorderRadius.circular(11),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 120, height: 14,
                        decoration: BoxDecoration(
                          color: Color.lerp(widget.shimmer, widget.base, t),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 60, height: 10,
                        decoration: BoxDecoration(
                          color: Color.lerp(widget.shimmer, widget.base, t),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 42, height: 26,
                  decoration: BoxDecoration(
                    color: Color.lerp(widget.shimmer, widget.base, t),
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ======================================================================
//  入场动画包装
// ======================================================================

class _AnimatedEntry extends StatefulWidget {
  final int index;
  final Widget child;

  const _AnimatedEntry({required this.index, required this.child});

  @override
  State<_AnimatedEntry> createState() => _AnimatedEntryState();
}

class _AnimatedEntryState extends State<_AnimatedEntry>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<Offset> _slide;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));
    _fade = Tween<double>(begin: 0, end: 1).animate(_ctrl);

    Future.delayed(Duration(milliseconds: 25 * widget.index), () {
      if (mounted) _ctrl.forward();
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slide,
      child: FadeTransition(opacity: _fade, child: widget.child),
    );
  }
}
