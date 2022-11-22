// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/action_result.dart';

class MsgActionResponse extends SoapResponse {
  /// The <action> element in the response always contains the same id list that the client sent in the request.
  /// In particular, IDs that were ignored due to constraints are included in the id list.
  final ActionResult? action;

  MsgActionResponse({this.action});

  factory MsgActionResponse.fromMap(Map<String, dynamic> data) =>
      MsgActionResponse(action: data['action'] is Map ? ActionResult.fromMap(data['action']) : null);
}
