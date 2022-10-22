// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';

class GetModifiedItemsIDsResponse extends SoapResponse {
  /// IDs of modified items
  final List<int> ids;

  GetModifiedItemsIDsResponse({this.ids = const []});

  factory GetModifiedItemsIDsResponse.fromJson(Map<String, dynamic> json) => GetModifiedItemsIDsResponse(
      ids: (json['ids'] is Iterable) ? List.from((json['ids'] as Iterable).map<int>((id) => id['_content'])) : []);
}