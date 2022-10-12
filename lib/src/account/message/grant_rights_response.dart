// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/account/type/account_ace_info.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';

class GrantRightsResponse extends SoapResponse {
  /// Access Control Entries
  final List<AccountACEInfo> aces;

  GrantRightsResponse({this.aces = const []});

  factory GrantRightsResponse.fromJson(Map<String, dynamic> json) => GrantRightsResponse(
      aces: (json['ace'] is Iterable)
          ? List.from((json['ace'] as Iterable).map<AccountACEInfo>((ace) => AccountACEInfo.fromJson(ace)))
          : []);
}
