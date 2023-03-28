// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';

class ChangePasswordResponse extends SoapResponse {
  /// New authToken, as old authToken is invalidated on password change.
  final String authToken;

  /// Life time associated with {new-auth-token}
  final int lifetime;

  ChangePasswordResponse({this.authToken = '', this.lifetime = 0});

  factory ChangePasswordResponse.fromMap(
    Map<String, dynamic> data,
  ) =>
      ChangePasswordResponse(
        authToken: data['authToken']?[0]['_content'] ?? '',
        lifetime: int.tryParse(data['lifetime']?.toString() ?? '') ?? 0,
      );
}
