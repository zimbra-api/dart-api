// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/action_result.dart';

class ConvActionResponse extends SoapResponse {
  /// Action result
  final ActionResult? action;

  ConvActionResponse({this.action});

  factory ConvActionResponse.fromJson(Map<String, dynamic> json) =>
      ConvActionResponse(action: json['action'] is Map ? ActionResult.fromJson(json['action']) : null);
}
