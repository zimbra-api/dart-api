// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/grantee_type.dart';

/// Input for grants
class ActionGrantSelector {
  /// Rights - Some combination of (r)ead, (w)rite, (i)nsert, (d)elete, (a)dminister, workflow action (x),
  /// view (p)rivate, view (f)reebusy, (c)reate subfolder
  final String rights;

  /// Grantee Type - usr | grp | cos | dom | all | pub | guest | key
  final GranteeType grantType;

  /// Zimbra ID
  final String? zimbraId;

  /// Name or email address of the grantee. Not present if granteeType is all or pub
  final String? displayName;

  /// Retained for backwards compatibility.  Old way of specifying password
  final String? args;

  /// Password when granteeType is gst
  final String? password;

  /// Optional argument. Access key when granteeType is "key"
  final String? accessKey;

  ActionGrantSelector(
    this.rights, {
    this.grantType = GranteeType.all,
    this.zimbraId,
    this.displayName,
    this.args,
    this.password,
    this.accessKey,
  });

  factory ActionGrantSelector.fromMap(Map<String, dynamic> data) => ActionGrantSelector(data['perm'] ?? '',
      grantType: GranteeType.values.firstWhere(
        (gt) => gt.name == data['gt'],
        orElse: () => GranteeType.all,
      ),
      zimbraId: data['zid'],
      displayName: data['d'],
      args: data['args'],
      password: data['pw'],
      accessKey: data['key']);

  Map<String, dynamic> toMap() => {
        'perm': rights,
        'gt': grantType.name,
        if (zimbraId != null) 'zid': zimbraId,
        if (displayName != null) 'd': displayName,
        if (args != null) 'args': args,
        if (password != null) 'pw': password,
        if (accessKey != null) 'key': accessKey,
      };
}
