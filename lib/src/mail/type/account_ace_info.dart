// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/enum/grantee_type.dart';

class AccountACEinfo {
  final GranteeType granteeType;

  final String right;

  final String? zimbraId;

  final String? displayName;

  final String? accessKey;

  final String? password;

  final bool? deny;

  const AccountACEinfo(
    this.granteeType,
    this.right, {
    this.zimbraId,
    this.displayName,
    this.accessKey,
    this.password,
    this.deny,
  });

  factory AccountACEinfo.fromMap(Map<String, dynamic> data) => AccountACEinfo(
      GranteeType.values.firstWhere(
        (gt) => gt.name == data['gt'],
        orElse: () => GranteeType.all,
      ),
      data['right'] ?? '',
      zimbraId: data['zid'],
      displayName: data['d'],
      password: data['pw'],
      accessKey: data['key'],
      deny: data['deny']);

  Map<String, dynamic> toMap() => {
        'gt': granteeType.name,
        'right': right,
        if (zimbraId != null) 'zid': zimbraId,
        if (displayName != null) 'd': displayName,
        if (password != null) 'pw': password,
        if (accessKey != null) 'key': accessKey,
        if (deny != null) 'deny': deny,
      };
}
