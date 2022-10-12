// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'attachment.dart';
import 'request.dart';

class Client {
  static const _userAgent = 'Dart Upload Client';
  static const _serviceUri = 'service/upload';
  static const _queryFormat = 'raw,extended';

  /// `multipart/form-data` http request.
  final http.MultipartRequest _httpRequest;

  Client(String serviceHost)
      : _httpRequest = http.MultipartRequest('POST', Uri.https(serviceHost, _serviceUri, {'fmt': _queryFormat}));

  Future<List<Attachment>> upload(Request request) {
    _httpRequest
      ..headers['User-Agent'] = _userAgent
      ..headers['Cookie'] = request.authTokenCookie
      ..fields['requestId'] = request.requestId
      ..files.addAll(request.files);
    return _httpRequest.send().then((response) {
      return http.Response.fromStream(response).then((response) => _parseResponse(response));
    });
  }

  List<Attachment> _parseResponse(http.Response response) {
    if (response.statusCode == 200) {
      return bodyToJson(response.body)
          .map<Attachment>((element) =>
              Attachment(element['aid'] ?? '', element['filename'] ?? '', element['ct'] ?? '', element['s'] ?? 0))
          .toList();
    }
    return [];
  }

  static Iterable bodyToJson(String body) {
    final exp = RegExp(r'/\[\{(.*)\}\]/');
    final match = exp.firstMatch(body);
    return jsonDecode(match![0]!).cast<Iterable>();
  }
}
