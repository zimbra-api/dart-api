// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with super source code.

import 'package:zimbra_api/src/common/enum/grantee_type.dart';

class AccountACEInfo {
  final GranteeType granteeType;

  final String right;

  final String? zimbraId;

  final String? displayName;

  final String? accessKey;

  final String? password;

  final bool? deny;

  final bool? checkGranteeType;

  AccountACEInfo(this.granteeType, this.right,
      {this.zimbraId, this.displayName, this.accessKey, this.password, this.deny, this.checkGranteeType});

  factory AccountACEInfo.fromJson(Map<String, dynamic> json) {
    final granteeType = GranteeType.values.firstWhere(
      (item) => item.name == json['gt'],
      orElse: () => GranteeType.all,
    );

    return AccountACEInfo(granteeType, json['right'] ?? '',
        zimbraId: json['zid'],
        displayName: json['d'],
        accessKey: json['key'],
        password: json['pw'],
        deny: json['deny'],
        checkGranteeType: json['chkgt']);
  }

  Map<String, dynamic> toJson() => {
        'gt': granteeType.name,
        'right': right,
        if (zimbraId != null) 'zid': zimbraId,
        if (displayName != null) 'd': displayName,
        if (accessKey != null) 'key': accessKey,
        if (password != null) 'pw': password,
        if (deny != null) 'deny': deny,
        if (checkGranteeType != null) 'chkgt': checkGranteeType,
      };
}
