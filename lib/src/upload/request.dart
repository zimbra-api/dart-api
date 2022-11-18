// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:http/http.dart';

class Request {
  static const accountAuthToken = 'ZM_AUTH_TOKEN';
  static const adminAuthToken = 'ZM_ADMIN_AUTH_TOKEN';

  /// Request id
  final String requestId;

  /// Http auth token cookie
  final String authToken;

  /// Upload files
  final List<MultipartFile> files;

  final bool isAdmin;

  const Request(this.requestId, this.authToken, this.files, {this.isAdmin = false});

  String get authTokenCookie => isAdmin ? "$adminAuthToken=$authToken" : "$accountAuthToken=$authToken";
}
