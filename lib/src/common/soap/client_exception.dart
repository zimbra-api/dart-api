// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:http/http.dart';

/// Exception when an HTTP error occurs (4xx or 5xx error)
class ClientException implements Exception {
  /// HTTP response was received
  final Response response;

  ///Exception message
  final String message;

  ClientException(this.response, this.message);
}
