// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/tag_action_info.dart';

class TagActionResponse extends SoapResponse {
  /// The <action> element contains information about the tags affected by
  /// the operation if and only if the operation was successful
  final TagActionInfo? action;

  TagActionResponse({this.action});

  factory TagActionResponse.fromMap(Map<String, dynamic> data) =>
      TagActionResponse(action: data['action'] is Map ? TagActionInfo.fromMap(data['action']) : null);
}
