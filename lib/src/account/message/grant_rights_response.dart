// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/account/type/account_ace_info.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';

class GrantRightsResponse extends SoapResponse {
  /// Access Control Entries
  final List<AccountACEInfo> aces;

  GrantRightsResponse({this.aces = const <AccountACEInfo>[]});

  factory GrantRightsResponse.fromJson(Map<String, dynamic> json) {
    final response = GrantRightsResponse();

    if (json['ace'] != null && json['ace'] is Iterable) {
      final aces = json['ace'] as Iterable;
      for (final ace in aces) {
        response.aces.add(AccountACEInfo.fromJson(ace));
      }
    }

    return response;
  }
}
