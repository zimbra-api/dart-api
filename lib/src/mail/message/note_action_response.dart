// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/action_result.dart';

class NoteActionResponse extends SoapResponse {
  /// The <action> element in the response always contains the same id list that the client sent in the request.
  /// In particular, IDs that were ignored due to constraints are included in the id list.
  final ActionResult? action;

  NoteActionResponse({this.action});

  factory NoteActionResponse.fromJson(Map<String, dynamic> json) =>
      NoteActionResponse(action: json['action'] is Map ? ActionResult.fromJson(json['action']) : null);
}