// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/account_ace_info.dart';

class GetPermissionResponse extends SoapResponse {
  /// Account ACE information
  final List<AccountACEinfo> aces;

  GetPermissionResponse({this.aces = const []});

  factory GetPermissionResponse.fromJson(Map<String, dynamic> json) => GetPermissionResponse(
      aces: (json['ace'] is Iterable)
          ? List.from((json['ace'] as Iterable).map<AccountACEinfo>((aces) => AccountACEinfo.fromJson(aces)))
          : []);
}
