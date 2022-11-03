// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'client_exception.dart';

class Client {
  static const _contentType = 'application/json; charset=utf-8';
  static const _userAgent = 'Dart Soap Client';
  static const _serviceUri = 'service/soap';

  final String _serviceHost;

  String? _cookie;

  final http.Client _httpClient = http.Client();

  Client(this._serviceHost);

  Future<http.Response> sendRequest(String soapMessage) {
    return _httpClient
        .post(Uri.https(_serviceHost, _serviceUri),
            headers: {
              'content-type': _contentType,
              'user-agent': _userAgent,
              if (_cookie != null) 'cookie': _cookie!,
            },
            body: soapMessage)
        .then((response) {
      if (response.hasError) {
        throw ClientException(response, 'An error is encountered with response status code ${response.statusCode}');
      }
      if (response.headers.containsKey('set-cookie')) {
        _cookie = response.headers['set-cookie'];
      }
      return response;
    });
  }

  void close() {
    _httpClient.close();
  }
}

extension ResponseExtension on http.Response {
  bool get hasError => (400 <= statusCode) && (statusCode < 600);

  bool get success => !hasError;

  dynamic get json => convert.jsonDecode(body);
}
