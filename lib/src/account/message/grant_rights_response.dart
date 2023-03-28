// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/account_ace_info.dart';

class GrantRightsResponse extends SoapResponse {
  /// Access Control Entries
  final List<AccountACEInfo> aces;

  GrantRightsResponse({this.aces = const []});

  factory GrantRightsResponse.fromMap(
    Map<String, dynamic> data,
  ) =>
      GrantRightsResponse(
        aces: (data['ace'] is Iterable)
            ? (data['ace'] as Iterable)
                .map<AccountACEInfo>(
                  (ace) => AccountACEInfo.fromMap(ace),
                )
                .toList(growable: false)
            : const [],
      );
}
