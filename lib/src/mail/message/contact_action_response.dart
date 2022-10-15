// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/folder_action_result.dart';

class ContactActionResponse extends SoapResponse {
  /// Action result
  final FolderActionResult? action;

  ContactActionResponse({this.action});

  factory ContactActionResponse.fromJson(Map<String, dynamic> json) =>
      ContactActionResponse(action: json['action'] is Map ? FolderActionResult.fromJson(json['action']) : null);
}
