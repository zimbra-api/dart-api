// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/tag_info.dart';

class CreateTagResponse extends SoapResponse {
  /// Information about the newly created tag
  final TagInfo? tag;

  CreateTagResponse({this.tag});

  factory CreateTagResponse.fromMap(Map<String, dynamic> data) =>
      CreateTagResponse(tag: data['tag'] is Map ? TagInfo.fromMap(data['tag']) : null);
}
