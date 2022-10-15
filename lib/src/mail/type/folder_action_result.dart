// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'action_result.dart';

/// Folder action response
class FolderActionResult extends ActionResult {
  /// Grantee Zimbra ID
  final String? zimbraId;

  /// Display name
  final String? displayName;

  /// Access key (Password)
  final String? accessKey;

  FolderActionResult(super.id, super.operation,
      {super.nonExistentIds, super.newlyCreatedIds, this.zimbraId, this.displayName, this.accessKey});

  factory FolderActionResult.fromJson(Map<String, dynamic> json) =>
      FolderActionResult(json['id'] ?? '', json['op'] ?? '',
          nonExistentIds: json['nei'],
          newlyCreatedIds: json['nci'],
          zimbraId: json['zid'],
          displayName: json['d'],
          accessKey: json['key']);

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'op': operation,
        if (nonExistentIds != null) 'nei': nonExistentIds,
        if (newlyCreatedIds != null) 'nci': newlyCreatedIds,
        if (zimbraId != null) 'zid': zimbraId,
        if (displayName != null) 'd': displayName,
        if (accessKey != null) 'key': accessKey,
      };
}
