// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/tag_info.dart';

class CreateTagResponse extends SoapResponse {
  /// Information about the newly created tag
  final TagInfo? tag;

  CreateTagResponse({this.tag});

  factory CreateTagResponse.fromJson(Map<String, dynamic> json) =>
      CreateTagResponse(tag: json['tag'] is Map ? TagInfo.fromJson(json['tag']) : null);
}
