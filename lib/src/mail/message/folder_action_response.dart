// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/folder_action_result.dart';

class FolderActionResponse extends SoapResponse {
  /// Folder action result
  final FolderActionResult? action;

  FolderActionResponse({this.action});

  factory FolderActionResponse.fromJson(Map<String, dynamic> json) =>
      FolderActionResponse(action: json['action'] is Map ? FolderActionResult.fromJson(json['action']) : null);
}