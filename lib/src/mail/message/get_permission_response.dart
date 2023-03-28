// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/account_ace_info.dart';

class GetPermissionResponse extends SoapResponse {
  /// Account ACE information
  final List<AccountACEinfo> aces;

  GetPermissionResponse({this.aces = const []});

  factory GetPermissionResponse.fromMap(
    Map<String, dynamic> data,
  ) =>
      GetPermissionResponse(
        aces: (data['ace'] is Iterable)
            ? (data['ace'] as Iterable)
                .map<AccountACEinfo>((aces) => AccountACEinfo.fromMap(aces))
                .toList(growable: false)
            : const [],
      );
}
