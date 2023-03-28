// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';

class GetModifiedItemsIDsResponse extends SoapResponse {
  /// IDs of modified items
  final List<int> ids;

  GetModifiedItemsIDsResponse({this.ids = const []});

  factory GetModifiedItemsIDsResponse.fromMap(
    Map<String, dynamic> data,
  ) =>
      GetModifiedItemsIDsResponse(
        ids: (data['ids'] is Iterable)
            ? (data['ids'] as Iterable)
                .map<int>(
                  (id) => int.parse(id['_content']?.toString() ?? '0'),
                )
                .toList(growable: false)
            : const [],
      );
}
