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

  factory Mountpoint.fromJson(Map<String, dynamic> json) => Mountpoint(
      ownerEmail: json['owner'],
      ownerAccountId: json['zid'],
      remoteFolderId: json['rid'],
      remoteUuid: json['ruuid'],
      remoteFolderName: json['oname'],
      reminderEnabled: json['reminder'],
      broken: json['broken'],
      id: json['id'],
      uuid: json['uuid'],
      name: json['name'],
      absoluteFolderPath: json['absFolderPath'],
      parentId: json['l'],
      folderUuid: json['luuid'],
      flags: json['f'],
      color: json['color'],
      rgb: json['rgb'],
      unreadCount: json['u'],
      imapUnreadCount: json['i4u'],
      view: ViewType.values.firstWhere(
        (view) => view.name == json['view'],
        orElse: () => ViewType.conversation,
      ),
      revision: json['rev'],
      modifiedSequence: json['ms'],
      changeDate: json['md'],
      itemCount: json['n'],
      imapItemCount: json['i4n'],
      totalSize: json['s'],
      imapModifiedSequence: json['i4ms'],
      imapUidNext: json['i4next'],
      url: json['url'],
      activeSyncDisabled: json['activesyncdisabled'],
      webOfflineSyncDays: json['webOfflineSyncDays'],
      perm: json['perm'],
      recursive: json['recursive'],
      restUrl: json['rest'],
      deletable: json['deletable'],
      metadatas: (json['meta'] is Iterable)
          ? List.from((json['meta'] as Iterable).map<MailCustomMetadata>((meta) => MailCustomMetadata.fromJson(meta)))
          : [],
      acl: json['acl'] is Map ? Acl.fromJson(json['acl']) : null,
      subFolders: (json['folder'] is Iterable)
          ? List.from((json['folder'] as Iterable).map<Folder>((folder) => Folder.fromJson(folder)))
          : [],
      mountpoints: (json['link'] is Iterable)
          ? List.from((json['link'] as Iterable).map<Mountpoint>((link) => Mountpoint.fromJson(link)))
          : [],
      searchFolders: (json['search'] is Iterable)
          ? List.from((json['search'] as Iterable).map<SearchFolder>((search) => SearchFolder.fromJson(search)))
          : [],
      retentionPolicy: json['retentionPolicy'] is Map ? RetentionPolicy.fromJson(json['retentionPolicy']) : null);

  @override
  Map<String, dynamic> toJson() => {
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
        if (metadatas.isNotEmpty) 'meta': metadatas.map((meta) => meta.toJson()).toList(),
        if (acl != null) 'acl': acl!.toJson(),
        if (subFolders.isNotEmpty) 'folder': subFolders.map((folder) => folder.toJson()).toList(),
        if (mountpoints.isNotEmpty) 'link': mountpoints.map((link) => link.toJson()).toList(),
        if (searchFolders.isNotEmpty) 'search': searchFolders.map((search) => search.toJson()).toList(),
        if (retentionPolicy != null) 'retentionPolicy': retentionPolicy!.toJson(),
      };
}
