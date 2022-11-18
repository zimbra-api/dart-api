// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class ShareInfo {
  /// Owner ID
  final String ownerId;

  /// Owner email
  final String ownerEmail;

  /// Owner display name
  final String? ownerDisplayName;

  /// Folder ID
  final int? folderId;

  /// Folder UUID
  final String? folderUuid;

  /// Fully qualified path
  final String? folderPath;

  /// Default type
  final String? defaultView;

  /// Rights
  final String? rights;

  /// Grantee type
  final String? granteeType;

  /// Grantee ID
  final String? granteeId;

  /// Grantee name
  final String? granteeName;

  /// Grantee display name
  final String? granteeDisplayName;

  /// Returned if the share is already mounted.
  /// Contains the folder id of the mountpoint in the local mailbox.
  final String? mountpointId;

  const ShareInfo(
    this.ownerId,
    this.ownerEmail, {
    this.ownerDisplayName,
    this.folderId,
    this.folderUuid,
    this.folderPath,
    this.defaultView,
    this.rights,
    this.granteeType,
    this.granteeId,
    this.granteeName,
    this.granteeDisplayName,
    this.mountpointId,
  });

  factory ShareInfo.fromMap(Map<String, dynamic> data) => ShareInfo(data['ownerId'], data['ownerEmail'],
      ownerDisplayName: data['ownerName'],
      folderId: int.tryParse(data['folderId']?.toString() ?? ''),
      folderUuid: data['folderUuid'],
      folderPath: data['folderPath'],
      defaultView: data['view'],
      rights: data['rights'],
      granteeType: data['granteeType'],
      granteeId: data['granteeId'],
      granteeName: data['granteeName'],
      granteeDisplayName: data['granteeDisplayName'],
      mountpointId: data['mid']);

  Map<String, dynamic> toMap() => {
        'ownerId': ownerId,
        'ownerEmail': ownerEmail,
        if (ownerDisplayName != null) 'ownerName': ownerDisplayName,
        if (folderId != null) 'folderId': folderId,
        if (folderUuid != null) 'folderUuid': folderUuid,
        if (folderPath != null) 'folderPath': folderPath,
        if (defaultView != null) 'view': defaultView,
        if (rights != null) 'rights': rights,
        if (granteeType != null) 'granteeType': granteeType,
        if (granteeId != null) 'granteeId': granteeId,
        if (granteeName != null) 'granteeName': granteeName,
        if (granteeDisplayName != null) 'granteeDisplayName': granteeDisplayName,
        if (mountpointId != null) 'mid': mountpointId,
      };
}
