// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/grant_grantee_type.dart';

/// A grant
class Grant {
  /// Rights - Some combination of (r)ead, (w)rite, (i)nsert, (d)elete, (a)dminister, workflow action (x), view (p)rivate, view (f)reebusy, (c)reate subfolder
  final String perm;

  /// Grantee Type - usr | grp | cos | dom | all | pub | guest | key
  final GrantGranteeType granteeType;

  /// Grantee ID
  final String? granteeId;

  /// Time when this grant expires
  final int? expiry;

  /// Name or email address of the principal being granted rights.
  final String? granteeName;

  /// Password for when granteeType is guest
  final String? guestPassword;

  /// Access key when granteeType is key
  final String? accessKey;

  Grant(this.perm,
      {this.granteeType = GrantGranteeType.all,
      this.granteeId,
      this.expiry,
      this.granteeName,
      this.guestPassword,
      this.accessKey});

  factory Grant.fromJson(Map<String, dynamic> json) => Grant(json['perm'] ?? '',
      granteeType: GrantGranteeType.values.firstWhere(
        (gt) => gt.name == json['gt'],
        orElse: () => GrantGranteeType.all,
      ),
      granteeId: json['zid'],
      expiry: json['expiry'],
      granteeName: json['d'],
      guestPassword: json['pw'],
      accessKey: json['key']);

  Map<String, dynamic> toJson() => {
        'perm': perm,
        'gt': granteeType.name,
        if (granteeId != null) 'zid': granteeId,
        if (expiry != null) 'expiry': expiry,
        if (granteeName != null) 'd': granteeName,
        if (guestPassword != null) 'pw': guestPassword,
        if (accessKey != null) 'key': accessKey,
      };
}
