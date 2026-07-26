import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

/// 统一 API 响应模型
///
/// SafeLine 接口标准响应格式：
/// ```json
/// { "data": ..., "err": "string", "msg": "string" }
/// ```
class ApiResponse<T> {
  final T? data;
  final String? err;
  final String? msg;
  final int statusCode;

  const ApiResponse({
    this.data,
    this.err,
    this.msg,
    required this.statusCode,
  });

  bool get isSuccess => statusCode == 200 && err == null;
}

/// HTTP 请求工具
///
/// 封装 [http.Client]，统一管理 baseUrl、token、异常处理与响应解析。
///
/// 使用方式：
/// ```dart
/// final api = ApiClient(baseUrl: 'https://example.com/api');
///
/// // GET 请求
/// final sites = await api.get('/open/site');
///
/// // POST 请求
/// final result = await api.post('/open/ipgroup', body: {'comment': 'test'});
/// ```
class ApiClient {
  final String baseUrl;
  final String? _token;
  final http.Client _client;
  final Duration timeout;

  ApiClient({
    required this.baseUrl,
    String? token,
    http.Client? client,
    this.timeout = const Duration(seconds: 15),
  })  : _token = token,
        _client = client ?? http.Client();

  /// 鉴权请求头
  Map<String, String> get _authHeaders {
    final token = _token;
    if (token == null) return {};
    return {'X-SLCE-API-TOKEN': token};
  }

  /// 构建完整 URI
  Uri _buildUri(String path, [Map<String, dynamic>? query]) {
    final base = baseUrl.endsWith('/') ? baseUrl.substring(0, baseUrl.length - 1) : baseUrl;
    final p = path.startsWith('/') ? path : '/$path';
    final fullUrl = '$base$p';
    final uri = Uri.parse(fullUrl);
    if (query != null && query.isNotEmpty) {
      return uri.replace(queryParameters: {
        for (final e in query.entries) e.key: e.value.toString(),
      });
    }
    return uri;
  }

  /// 发起 GET 请求
  Future<ApiResponse<dynamic>> get(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) async {
    final uri = _buildUri(path, query);
    debugPrint('[ApiClient] GET $uri');
    try {
      final response = await _client
          .get(uri, headers: {..._authHeaders, ...?headers})
          .timeout(timeout);
      debugPrint('[ApiClient] Response ${response.statusCode}');
      return _parseResponse(response);
    } catch (e) {
      debugPrint('[ApiClient] Error: $e');
      return _handleError(e);
    }
  }

  /// 发起 POST 请求
  Future<ApiResponse<dynamic>> post(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    dynamic body,
  }) async {
    try {
      final response = await _client
          .post(
            _buildUri(path, query),
            headers: {
              ..._authHeaders,
              'Content-Type': 'application/json',
              ...?headers,
            },
            body: body != null ? jsonEncode(body) : null,
          )
          .timeout(timeout);
      return _parseResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  /// 发起 PUT 请求
  Future<ApiResponse<dynamic>> put(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    dynamic body,
  }) async {
    final uri = _buildUri(path, query);
    debugPrint('[ApiClient] PUT $uri body=$body');
    try {
      final response = await _client
          .put(
            uri,
            headers: {
              ..._authHeaders,
              'Content-Type': 'application/json',
              ...?headers,
            },
            body: body != null ? jsonEncode(body) : null,
          )
          .timeout(timeout);
      debugPrint('[ApiClient] Response ${response.statusCode}');
      return _parseResponse(response);
    } catch (e) {
      debugPrint('[ApiClient] Error: $e');
      return _handleError(e);
    }
  }

  /// 发起 DELETE 请求
  Future<ApiResponse<dynamic>> delete(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    dynamic body,
  }) async {
    try {
      final request = http.Request('DELETE', _buildUri(path, query));
      request.headers.addAll({
        ..._authHeaders,
        'Content-Type': 'application/json',
        ...?headers,
      });
      if (body != null) {
        request.body = jsonEncode(body);
      }
      final streamed = await _client.send(request).timeout(timeout);
      final response = await http.Response.fromStream(streamed);
      return _parseResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  /// 解析响应体
  ApiResponse<dynamic> _parseResponse(http.Response response) {
    dynamic body;
    try {
      body = jsonDecode(response.body);
    } catch (_) {
      body = response.body;
    }

    if (body is Map) {
      return ApiResponse(
        data: body['data'],
        err: body['err']?.toString(),
        msg: body['msg']?.toString(),
        statusCode: response.statusCode,
      );
    }

    return ApiResponse(
      data: body,
      statusCode: response.statusCode,
    );
  }

  /// 统一异常处理
  ApiResponse<dynamic> _handleError(Object e) {
    return ApiResponse(
      statusCode: -1,
      err: 'NETWORK_ERROR',
      msg: '网络请求失败：$e',
    );
  }

  /// 释放资源
  void dispose() {
    _client.close();
  }
}
