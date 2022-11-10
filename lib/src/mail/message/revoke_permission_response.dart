// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/mail/type/account_ace_info.dart';

import 'get_permission_response.dart';

class RevokePermissionResponse extends GetPermissionResponse {
  RevokePermissionResponse({super.aces = const []});

  factory RevokePermissionResponse.fromMap(Map<String, dynamic> data) => RevokePermissionResponse(
      aces: (data['ace'] is Iterable)
          ? (data['ace'] as Iterable)
              .map<AccountACEinfo>((aces) => AccountACEinfo.fromMap(aces))
              .toList(growable: false)
          : const []);
}
