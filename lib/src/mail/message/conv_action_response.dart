// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/action_result.dart';

class ConvActionResponse extends SoapResponse {
  /// Action result
  final ActionResult? action;

  ConvActionResponse({this.action});

  factory ConvActionResponse.fromMap(Map<String, dynamic> data) =>
      ConvActionResponse(action: data['action'] is Map ? ActionResult.fromMap(data['action']) : null);
}
