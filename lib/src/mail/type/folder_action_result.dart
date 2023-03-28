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

  const FolderActionResult(
    super.id,
    super.operation, {
    super.nonExistentIds,
    super.newlyCreatedIds,
    this.zimbraId,
    this.displayName,
    this.accessKey,
  });

  factory FolderActionResult.fromMap(
    Map<String, dynamic> data,
  ) =>
      FolderActionResult(
        data['id'] ?? '',
        data['op'] ?? '',
        nonExistentIds: data['nei'],
        newlyCreatedIds: data['nci'],
        zimbraId: data['zid'],
        displayName: data['d'],
        accessKey: data['key'],
      );

  @override
  Map<String, dynamic> toMap() => {
        'id': id,
        'op': operation,
        if (nonExistentIds != null) 'nei': nonExistentIds,
        if (newlyCreatedIds != null) 'nci': newlyCreatedIds,
        if (zimbraId != null) 'zid': zimbraId,
        if (displayName != null) 'd': displayName,
        if (accessKey != null) 'key': accessKey,
      };
}
