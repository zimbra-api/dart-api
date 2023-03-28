// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/folder_action_result.dart';

class ContactActionResponse extends SoapResponse {
  /// Action result
  final FolderActionResult? action;

  ContactActionResponse({this.action});

  factory ContactActionResponse.fromMap(
    Map<String, dynamic> data,
  ) =>
      ContactActionResponse(
        action: data['action'] is Map
            ? FolderActionResult.fromMap(
                data['action'],
              )
            : null,
      );
}
