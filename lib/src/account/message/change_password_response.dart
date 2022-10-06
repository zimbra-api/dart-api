// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';

class ChangePasswordResponse extends SoapResponse {
  /// New authToken, as old authToken is invalidated on password change.
  String authToken;

  /// Life time associated with {new-auth-token}
  int lifetime;

  ChangePasswordResponse({this.authToken = '', this.lifetime = 0});

  factory ChangePasswordResponse.fromJson(json) =>
      ChangePasswordResponse(authToken: json['authToken'] ?? '', lifetime: json['lifetime'] ?? 0);
}
