// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/mail/type/account_ace_info.dart';

import 'get_permission_response.dart';

class GrantPermissionResponse extends GetPermissionResponse {
  GrantPermissionResponse({super.aces = const []});

  factory GrantPermissionResponse.fromJson(Map<String, dynamic> json) => GrantPermissionResponse(
      aces: (json['ace'] is Iterable)
          ? List.from((json['ace'] as Iterable).map<AccountACEinfo>((aces) => AccountACEinfo.fromJson(aces)))
          : []);
}