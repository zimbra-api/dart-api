// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/view_type.dart';

import 'acl.dart';
import 'folder.dart';
import 'mail_custom_metadata.dart';
import 'retention_policy.dart';
import 'search_folder.dart';

class Mountpoint extends Folder {
  /// Primary email address of the owner of the linked-to resource
  final String? ownerEmail;

  /// Zimbra ID (guid) of the owner of the linked-to resource
  final String? ownerAccountId;

  /// Item ID of the linked-to resource in the remote mailbox
  final int? remoteFolderId;

  /// UUID of the linked-to resource in the remote mailbox
  final String? remoteUuid;

  /// The name presently used for the item by the owner
  final String? remoteFolderName;

  /// If set, client should display reminders for shared appointments/tasks
  final bool? reminderEnabled;

  /// If "tr" is true in the request, broken is set if this is a broken link
  final bool? broken;

  Mountpoint(
      {this.ownerEmail,
      this.ownerAccountId,
      this.remoteFolderId,
      this.remoteUuid,
      this.remoteFolderName,
      this.reminderEnabled,
      this.broken,
      super.id,
      super.uuid,
      super.name,
      super.absoluteFolderPath,
      super.parentId,
      super.folderUuid,
      super.flags,
      super.color,
      super.rgb,
      super.unreadCount,
      super.imapUnreadCount,
      super.view,
      super.revision,
      super.modifiedSequence,
      super.changeDate,
      super.itemCount,
      super.imapItemCount,
      super.totalSize,
      super.imapModifiedSequence,
      super.imapUidNext,
      super.url,
      super.activeSyncDisabled,
      super.webOfflineSyncDays,
      super.perm,
      super.recursive,
      super.restUrl,
      super.deletable,
      super.metadatas = const [],
      super.acl,
      super.subFolders = const [],
      super.mountpoints = const [],
      super.searchFolders = const [],
      super.retentionPolicy});

  factory Mountpoint.fromMap(Map<String, dynamic> data) => Mountpoint(
      ownerEmail: data['owner'],
      ownerAccountId: data['zid'],
      remoteFolderId: data['rid'],
      remoteUuid: data['ruuid'],
      remoteFolderName: data['oname'],
      reminderEnabled: data['reminder'],
      broken: data['broken'],
      id: data['id'],
      uuid: data['uuid'],
      name: data['name'],
      absoluteFolderPath: data['absFolderPath'],
      parentId: data['l'],
      folderUuid: data['luuid'],
      flags: data['f'],
      color: int.tryParse(data['color']?.toString() ?? ''),
      rgb: data['rgb'],
      unreadCount: int.tryParse(data['u']?.toString() ?? ''),
      imapUnreadCount: int.tryParse(data['i4u']?.toString() ?? ''),
      view: ViewType.values.firstWhere(
        (view) => view.name == data['view'],
        orElse: () => ViewType.conversation,
      ),
      revision: int.tryParse(data['rev']?.toString() ?? ''),
      modifiedSequence: int.tryParse(data['ms']?.toString() ?? ''),
      changeDate: int.tryParse(data['md']?.toString() ?? ''),
      itemCount: int.tryParse(data['n']?.toString() ?? ''),
      imapItemCount: int.tryParse(data['i4n']?.toString() ?? ''),
      totalSize: int.tryParse(data['s']?.toString() ?? ''),
      imapModifiedSequence: int.tryParse(data['i4ms']?.toString() ?? ''),
      imapUidNext: int.tryParse(data['i4next']?.toString() ?? ''),
      url: data['url'],
      activeSyncDisabled: data['activesyncdisabled'],
      webOfflineSyncDays: int.tryParse(data['webOfflineSyncDays']?.toString() ?? ''),
      perm: data['perm'],
      recursive: data['recursive'],
      restUrl: data['rest'],
      deletable: data['deletable'],
      metadatas: (data['meta'] is Iterable)
          ? (data['meta'] as Iterable)
              .map<MailCustomMetadata>((meta) => MailCustomMetadata.fromMap(meta))
              .toList(growable: false)
          : const [],
      acl: data['acl'] is Map ? Acl.fromMap(data['acl']) : null,
      subFolders: (data['folder'] is Iterable)
          ? (data['folder'] as Iterable).map<Folder>((folder) => Folder.fromMap(folder)).toList(growable: false)
          : const [],
      mountpoints: (data['link'] is Iterable)
          ? (data['link'] as Iterable).map<Mountpoint>((link) => Mountpoint.fromMap(link)).toList(growable: false)
          : const [],
      searchFolders: (data['search'] is Iterable)
          ? (data['search'] as Iterable)
              .map<SearchFolder>((search) => SearchFolder.fromMap(search))
              .toList(growable: false)
          : const [],
      retentionPolicy: data['retentionPolicy']?[0] is Map ? RetentionPolicy.fromMap(data['retentionPolicy'][0]) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (ownerEmail != null) 'owner': ownerEmail,
        if (ownerAccountId != null) 'zid': ownerAccountId,
        if (remoteFolderId != null) 'rid': remoteFolderId,
        if (remoteUuid != null) 'ruuid': remoteUuid,
        if (remoteFolderName != null) 'oname': remoteFolderName,
        if (reminderEnabled != null) 'reminder': reminderEnabled,
        if (broken != null) 'broken': broken,
        if (id != null) 'id': id,
        if (uuid != null) 'uuid': uuid,
        if (name != null) 'name': name,
        if (absoluteFolderPath != null) 'absFolderPath': absoluteFolderPath,
        if (parentId != null) 'l': parentId,
        if (folderUuid != null) 'luuid': folderUuid,
        if (flags != null) 'f': flags,
        if (color != null) 'color': color,
        if (rgb != null) 'rgb': rgb,
        if (unreadCount != null) 'u': unreadCount,
        if (imapUnreadCount != null) 'i4u': imapUnreadCount,
        if (view != null) 'view': view!.name,
        if (revision != null) 'rev': revision,
        if (modifiedSequence != null) 'ms': modifiedSequence,
        if (changeDate != null) 'md': changeDate,
        if (itemCount != null) 'n': itemCount,
        if (imapItemCount != null) 'i4n': imapItemCount,
        if (totalSize != null) 's': totalSize,
        if (imapModifiedSequence != null) 'i4ms': imapModifiedSequence,
        if (imapUidNext != null) 'i4next': imapUidNext,
        if (url != null) 'url': url,
        if (activeSyncDisabled != null) 'activesyncdisabled': activeSyncDisabled,
        if (webOfflineSyncDays != null) 'webOfflineSyncDays': webOfflineSyncDays,
        if (perm != null) 'perm': perm,
        if (recursive != null) 'recursive': recursive,
        if (restUrl != null) 'rest': restUrl,
        if (deletable != null) 'deletable': deletable,
        if (metadatas.isNotEmpty) 'meta': metadatas.map((meta) => meta.toMap()).toList(growable: false),
        if (acl != null) 'acl': acl!.toMap(),
        if (subFolders.isNotEmpty) 'folder': subFolders.map((folder) => folder.toMap()).toList(growable: false),
        if (mountpoints.isNotEmpty) 'link': mountpoints.map((link) => link.toMap()).toList(growable: false),
        if (searchFolders.isNotEmpty) 'search': searchFolders.map((search) => search.toMap()).toList(growable: false),
        if (retentionPolicy != null) 'retentionPolicy': retentionPolicy!.toMap(),
      };
}
