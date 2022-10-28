// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';

class VerifyCodeResponse extends SoapResponse {
  /// Flags whether verification was successful
  final bool success;

  VerifyCodeResponse({this.success = false});

  factory VerifyCodeResponse.fromJson(Map<String, dynamic> json) =>
      VerifyCodeResponse(success: json['success'] ?? false);
}
