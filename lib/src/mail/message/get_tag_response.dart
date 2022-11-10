// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/tag_info.dart';

class GetTagResponse extends SoapResponse {
  /// Information about tags
  final List<TagInfo> tags;

  GetTagResponse({this.tags = const []});

  factory GetTagResponse.fromMap(Map<String, dynamic> data) => GetTagResponse(
      tags: (data['tag'] is Iterable)
          ? (data['tag'] as Iterable).map<TagInfo>((tag) => TagInfo.fromMap(tag)).toList(growable: false)
          : const []);
}
