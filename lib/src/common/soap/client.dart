// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:http/http.dart' as http;

class Client {
  static const _contentType = 'application/json; charset=utf-8';
  static const _userAgent = 'Dart-Zimbra-Soap-Client';
  static const _serviceUri = 'service/soap';

  final String _serviceHost;

  final http.Client _httpClient = http.Client();

  Client(this._serviceHost);

  Future<http.Response> sendRequest(String soapMessage) {
    return _httpClient.post(Uri.https(_serviceHost, _serviceUri),
        headers: {'Content-Type': _contentType, 'User-Agent': _userAgent}, body: soapMessage);
  }

  void close() {
    _httpClient.close();
  }
}
