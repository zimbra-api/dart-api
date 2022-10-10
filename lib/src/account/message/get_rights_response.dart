// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/account/type/account_ace_info.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';

class GetRightsResponse extends SoapResponse {
  /// Access Control Entries
  final List<AccountACEInfo> aces;

  GetRightsResponse({this.aces = const <AccountACEInfo>[]});

  factory GetRightsResponse.fromJson(Map<String, dynamic> json) {
    final aces = <AccountACEInfo>[];
    if (json['ace'] != null && json['ace'] is Iterable) {
      final elements = json['ace'] as Iterable;
      for (final ace in elements) {
        aces.add(AccountACEInfo.fromJson(ace));
      }
    }

    return GetRightsResponse(aces: aces);
  }
}
