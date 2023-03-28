// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'client_exception.dart';

typedef HttpClientFactory<T extends http.Client> = T Function();

class Client {
  static const contentType = 'application/json; charset=utf-8';
  static const userAgent = 'Dart Soap Client';
  static const servicePath = '/service/soap';

  final String _serviceHost;

  final _headers = {
    'content-type': contentType,
    'user-agent': userAgent,
  };

  final http.Client _httpClient;

  Client(this._serviceHost, {final HttpClientFactory? httpClientFactory})
      : _httpClient =
            httpClientFactory != null ? httpClientFactory() : http.Client();

  Future<http.Response> sendRequest(final String soapMessage) {
    return _httpClient
        .post(Uri.https(_serviceHost, servicePath),
            headers: _headers, body: soapMessage)
        .then((response) {
      if (response.hasError) {
        throw ClientException(
          response,
          'An error is encountered with response status code ${response.statusCode}',
        );
      }
      if (response.headers.containsKey('set-cookie')) {
        _headers['cookie'] = response.headers['set-cookie']!;
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

  bool get isJson =>
      (headers['content-type'] ?? '').contains('text/javascript') ||
      (headers['content-type'] ?? '').contains('application/json');

  Map<String, dynamic> get mapData => isJson ? jsonDecode(body) : {};
}
