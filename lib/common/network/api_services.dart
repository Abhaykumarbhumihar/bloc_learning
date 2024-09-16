import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class ApiServices {
  final String apiBaseUri;

  ApiServices(this.apiBaseUri);

  Future<http.Response> _request(
      String method,
      String url, {
        Map<String, String>? headers,
        Map<String, dynamic>? body,
        http.MultipartFile? file,
      }) async {
    final apiUrl = Uri.parse(apiBaseUri + url);

    if (method == 'POST' && file != null) {
      // Handle multipart request
      final request = http.MultipartRequest('POST', apiUrl)
        ..headers.addAll(headers ?? {})
        ..fields.addAll(_convertBodyToFields(body));

      if (file != null) {
        request.files.add(file);
      }

      try {
        final streamedResponse = await request.send();
        final response = await http.Response.fromStream(streamedResponse);
        return response;
      } catch (e) {
        throw Exception("Failed to make POST request: $e");
      }
    } else if (method == 'POST') {
      // Handle regular POST request
      final request = http.Request('POST', apiUrl)
        ..headers.addAll(headers ?? {})
        ..body = json.encode(body);

      try {
        final response = await http.Response.fromStream(await request.send());
        return response;
      } catch (e) {
        throw Exception("Failed to make POST request: $e");
      }
    } else {
      // Handle GET request
      final request = http.Request('GET', apiUrl)
        ..headers.addAll(headers ?? {});

      try {
        final response = await http.Response.fromStream(await request.send());
        return response;
      } catch (e) {
        throw Exception("Failed to make GET request: $e");
      }
    }
  }

  Map<String, String> _convertBodyToFields(Map<String, dynamic>? body) {
    if (body == null) return {};
    return body.map((key, value) => MapEntry(key, value.toString()));
  }

  Future<http.Response> get(String url) async {
    return _request('GET', url);
  }

  Future<http.Response> getWithParams(String url, String type) async {
    return _request('GET', '$url?type=$type');
  }

  Future<http.Response> post(String url, Map<String, dynamic> body) async {
    return _request('POST', url, body: body);
  }

  Future<http.Response> postWithHeaders(String url, Map<String, dynamic> body,Map<String, String> headers) async {
    return _request('POST', url, headers: _defaultHeaders()..addAll(headers ?? {}), body: body);
  }

  Future<http.Response> postWithoutBody(String url) async {
    return _request('POST', url, headers: _defaultHeaders());
  }

  Future<http.Response> getWithHeaders(String url,Map<String, String> headers) async {
    return _request('GET', url, headers: _defaultHeaders()..addAll(headers??{}));
  }

  Future<http.Response> multiPartImage({
    File? image,
    required String url,
    required Map<String, String> fields,
  }) async {
    final file = image != null
        ? http.MultipartFile.fromBytes(
        'file', File(image.path).readAsBytesSync(), filename: image.path.split("/").last)
        : null;

    return _request('POST', url, headers: _defaultHeaders(), body: fields, file: file);
  }

  Map<String, String> _defaultHeaders() {
    return {
      //'Authorization': AppConstant.BEARER + (SharedPrefs.getString("accesstoken") ?? ''),
      //'x-csrf-token': SharedPrefs.getString("xcrftoken") ?? "",
    };
  }
}
