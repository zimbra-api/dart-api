// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/account/type/account_ace_info.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';

class RevokeRightsResponse extends SoapResponse {
  /// Access Control Entries
  final List<AccountACEInfo> aces;

  RevokeRightsResponse({this.aces = const []});

  factory RevokeRightsResponse.fromMap(Map<String, dynamic> data) => RevokeRightsResponse(
      aces: (data['ace'] is Iterable)
          ? List.from((data['ace'] as Iterable).map<AccountACEInfo>((ace) => AccountACEInfo.fromMap(ace)))
          : []);
}
