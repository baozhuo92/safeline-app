import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../config/app_config.dart';
import '../theme/app_colors.dart';
import '../utils/api_client.dart';
import '../widgets/app_navbar.dart';

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

  Widget _buildBody() {
    if (_loading) {
      return Center(
        child: CircularProgressIndicator(
          color: AppColors.primary,
          strokeWidth: 3,
        ),
      );
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: AppColors.dangerBg,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.cloud_off_rounded,
                size: 36,
                color: AppColors.danger,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              _error!,
              style: TextStyle(color: AppThemeColors.of(context).textSecondary),
            ),
            const SizedBox(height: 20),
            _buildGlassButton('重试', Icons.refresh, () {
              setState(() {
                _loading = true;
                _error = null;
              });
              _fetchSites();
            }),
          ],
        ),
      );
    }

    if (_sites.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inventory_2_outlined,
              size: 52,
              color: AppThemeColors.of(context).textPlaceholder,
            ),
            const SizedBox(height: 12),
            Text(
              '暂无数据',
              style: TextStyle(
                color: AppThemeColors.of(context).textSecondary,
                fontSize: 15,
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
      fit: StackFit.expand,
      children: [
        Column(
          children: [
            _buildTabBar(),
            Expanded(
              child: filtered.isEmpty
                  ? Center(
                      child: Text(
                        '该模式下暂无数据',
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
                          vertical: 8,
                        ),
                        itemCount: filtered.length,
                        itemBuilder: (context, index) =>
                            _buildSiteCard(filtered[index]),
                      ),
                    ),
            ),
          ],
        ),
        Positioned(
          right: 16,
          bottom: 16,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: _showBackTop ? 1 : 0,
            child: GestureDetector(
              onTap: () => _scrollController.animateTo(
                0,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOutCubic,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withAlpha(140),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: Colors.white.withAlpha(30),
                        width: 0.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withAlpha(40),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.arrow_upward_rounded,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGlassButton(String text, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.primary.withAlpha(25),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.primary.withAlpha(50),
            width: 0.5,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 17, color: AppColors.primary),
            const SizedBox(width: 6),
            Text(
              text,
              style: const TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    const tabs = [
      {'label': '全部', 'mode': null, 'icon': Icons.apps},
      {'label': '防御', 'mode': 0, 'icon': Icons.shield_outlined},
      {'label': '维护', 'mode': 1, 'icon': Icons.build_outlined},
      {'label': '观察', 'mode': 2, 'icon': Icons.visibility_outlined},
    ];

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: isDark
                ? GlassColors.glassNavBg(isDark).withAlpha(100)
                : const Color(0xFFFFFFFF).withAlpha(80),
            border: Border(
              bottom: BorderSide(
                color: GlassColors.glassBorder(isDark),
                width: 0.5,
              ),
            ),
          ),
          child: Row(
            children: tabs.map((tab) {
              final mode = tab['mode'] as int?;
              final selected = _selectedMode == mode;
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedMode = mode),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 220),
                      curve: Curves.easeOutCubic,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: selected
                            ? AppColors.primary
                            : isDark
                            ? Colors.white.withAlpha(6)
                            : Colors.black.withAlpha(5),
                        borderRadius: BorderRadius.circular(22),
                        border: selected
                            ? null
                            : Border.all(
                                color: isDark
                                    ? Colors.white.withAlpha(6)
                                    : Colors.black.withAlpha(10),
                                width: 0.5,
                              ),
                        boxShadow: selected
                            ? [
                                BoxShadow(
                                  color: AppColors.primary.withAlpha(70),
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
                          color: selected
                              ? Colors.white
                              : AppThemeColors.of(context).textSecondary,
                          fontWeight: selected
                              ? FontWeight.w600
                              : FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar(String? base64, String title) {
    Widget? image;
    if (base64 != null && base64.isNotEmpty) {
      try {
        String raw = base64;
        if (raw.contains(',')) {
          raw = raw.split(',').last;
        }
        final bytes = base64Decode(raw);
        image = Image.memory(
          bytes,
          width: 44,
          height: 44,
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) => _fallbackAvatar(title),
        );
      } catch (_) {
        image = _fallbackAvatar(title);
      }
    } else {
      image = _fallbackAvatar(title);
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(width: 44, height: 44, child: image),
    );
  }

  Widget _fallbackAvatar(String title) {
    final letter = title.isNotEmpty ? title.characters.first : '?';
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary400, AppColors.primary600],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
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

  Widget _buildSiteCard(dynamic site) {
    final themeColors = AppThemeColors.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (site is! Map) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: _glassSurface(
          isDark,
          child: ListTile(title: Text(site.toString())),
        ),
      );
    }

    final map = site as Map<String, dynamic>;
    final id = map['id'] as int?;
    final title = map['title']?.toString() ?? '未命名';
    final serverNames =
        (map['server_names'] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList() ??
        [];
    final ports =
        (map['ports'] as List<dynamic>?)?.map((e) => e.toString()).toList() ??
        [];
    final upstreams =
        (map['upstreams'] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList() ??
        [];

    final mode = map['mode'] as int? ?? 0;
    final modeLabel = {0: '防御', 1: '维护', 2: '观察'}[mode] ?? '未知';
    final modeColor =
        {0: AppColors.success, 1: AppColors.warning, 2: AppColors.info}[mode] ??
        AppColors.danger;

    final iconBase64 = map['icon']?.toString();
    final urls = _buildUrls(serverNames, ports);
    final showSwitch = mode == 0 || mode == 1;
    final isToggling = id != null && _togglingIds.contains(id);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: GlassColors.glassSurface(isDark),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: GlassColors.glassBorder(isDark),
                    width: 0.6,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: GlassColors.glassShadow(isDark),
                      blurRadius: 28,
                      offset: const Offset(0, 12),
                    ),
                    BoxShadow(
                      color: GlassColors.glassShadow(isDark).withAlpha(isDark ? 80 : 200),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          _buildAvatar(iconBase64, title),
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
                                    letterSpacing: -0.2,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                _buildModeBadge(modeLabel, modeColor),
                              ],
                            ),
                          ),
                          if (showSwitch)
                            _buildGlassSwitch(
                              mode == 0,
                              isToggling,
                              () => _toggleSiteMode(map),
                            ),
                        ],
                      ),
                      if (urls.isNotEmpty) ...[
                        const SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          height: 0.5,
                          color: GlassColors.glassBorder(isDark),
                        ),
                        const SizedBox(height: 8),
                        ...urls.map(
                          (url) => Padding(
                            padding: const EdgeInsets.only(top: 2),
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
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
        ),
        Positioned(
          top: 0,
          left: 14,
          right: 14,
          child: Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  GlassColors.glassHighlight(isDark),
                  Colors.white.withAlpha(0),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildModeBadge(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withAlpha(20),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withAlpha(40), width: 0.5),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildGlassSwitch(bool value, bool loading, VoidCallback onToggle) {
    return GestureDetector(
      onTap: loading ? null : onToggle,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        width: 42,
        height: 26,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: value
              ? AppColors.primary.withAlpha(200)
              : Colors.white.withAlpha(20),
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
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOutCubic,
              alignment: value ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: 20,
                height: 20,
                child: loading
                    ? const CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      )
                    : AnimatedContainer(
                        duration: const Duration(milliseconds: 220),
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _glassSurface(bool isDark, {required Widget child}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          decoration: BoxDecoration(
            color: GlassColors.glassSurface(isDark),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: GlassColors.glassBorder(isDark),
              width: 0.5,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
