// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/view_type.dart';

import 'acl.dart';
import 'mail_custom_metadata.dart';
import 'mountpoint.dart';
import 'retention_policy.dart';
import 'search_folder.dart';

/// A Folder
class Folder {
  /// The folder id
  final String? id;

  /// Item's UUID - a globally unique identifier
  final String? uuid;

  /// Name of folder; max length 128; whitespace is trimmed by server;
  /// Cannot contain ':', '"', '/', or any character below 0x20
  final String? name;

  /// Absolute folder path
  final String? absoluteFolderPath;

  /// ID of parent folder (absent for root folder)
  final String? parentId;

  /// UUID of parent folder (absent for root folder)
  final String? folderUuid;

  /// Flags - checked in UI (#), exclude free/(b)usy info, IMAP subscribed (*),
  /// does not (i)nherit rights from parent, is a s(y)nc folder with external data source,
  /// sync is turned on(~), folder does n(o)t allow inferiors / children
  final String? flags;

  /// Color numeric; range 0-127; defaults to 0 if not present; client can display only 0-7
  final int? color;

  /// RGB color in format #rrggbb where r,g and b are hex digits
  final String? rgb;

  /// Number of unread messages in folder
  final int? unreadCount;

  /// Number of unread messages with this tag, including those with the IMAP \\Deleted flag set
  final int? imapUnreadCount;

  /// Default type for the folder; used by web client to decide which view to use.
  final ViewType? view;

  /// Revision
  final int? revision;

  /// Modified sequence
  final int? modifiedSequence;

  /// Modified date in seconds
  final int? changeDate;

  /// Number of non-subfolder items in folder
  final int? itemCount;

  /// Number of non-subfolder items in folder, including those with the IMAP \\Deleted flag set
  final int? imapItemCount;

  /// Total size of all of non-subfolder items in folder
  final int? totalSize;

  /// Imap modified sequence
  final int? imapModifiedSequence;

  /// IMAP UIDNEXT
  final int? imapUidNext;

  /// URL (RSS, iCal, etc.) this folder syncs its contents to
  final String? url;

  /// Active sync status
  final bool? activeSyncDisabled;

  /// Number of days for which web client would sync folder data for offline use
  final int? webOfflineSyncDays;

  /// For remote folders, the access rights the authenticated user has on the folder
  /// will contain the calculated (c)reate folder permission if the user has both (i)nsert and (r)ead access on the folder
  final String? perm;

  /// Recursive
  final bool? recursive;

  /// URL to the folder in the REST interface for rest-enabled apps (such as notebook)
  final String? restUrl;

  /// Whether this folder can be deleted
  final bool? deletable;

  /// Custom metadata
  final List<MailCustomMetadata> metadatas;

  /// ACL for sharing
  final Acl? acl;

  /// Sub folders
  final List<Folder> subFolders;

  /// Mount points
  final List<Mountpoint> mountpoints;

  /// Search folders
  final List<SearchFolder> searchFolders;

  /// Retention policy
  final RetentionPolicy? retentionPolicy;

  Folder(
      {this.id,
      this.uuid,
      this.name,
      this.absoluteFolderPath,
      this.parentId,
      this.folderUuid,
      this.flags,
      this.color,
      this.rgb,
      this.unreadCount,
      this.imapUnreadCount,
      this.view,
      this.revision,
      this.modifiedSequence,
      this.changeDate,
      this.itemCount,
      this.imapItemCount,
      this.totalSize,
      this.imapModifiedSequence,
      this.imapUidNext,
      this.url,
      this.activeSyncDisabled,
      this.webOfflineSyncDays,
      this.perm,
      this.recursive,
      this.restUrl,
      this.deletable,
      this.metadatas = const [],
      this.acl,
      this.subFolders = const [],
      this.mountpoints = const [],
      this.searchFolders = const [],
      this.retentionPolicy});

  factory Folder.fromMap(Map<String, dynamic> data) => Folder(
      id: data['id'],
      uuid: data['uuid'],
      name: data['name'],
      absoluteFolderPath: data['absFolderPath'],
      parentId: data['l'],
      folderUuid: data['luuid'],
      flags: data['f'],
      color: data['color'],
      rgb: data['rgb'],
      unreadCount: data['u'],
      imapUnreadCount: data['i4u'],
      view: ViewType.values.firstWhere(
        (view) => view.name == data['view'],
        orElse: () => ViewType.conversation,
      ),
      revision: data['rev'],
      modifiedSequence: data['ms'],
      changeDate: data['md'],
      itemCount: data['n'],
      imapItemCount: data['i4n'],
      totalSize: data['s'],
      imapModifiedSequence: data['i4ms'],
      imapUidNext: data['i4next'],
      url: data['url'],
      activeSyncDisabled: data['activesyncdisabled'],
      webOfflineSyncDays: data['webOfflineSyncDays'],
      perm: data['perm'],
      recursive: data['recursive'],
      restUrl: data['rest'],
      deletable: data['deletable'],
      metadatas: (data['meta'] is Iterable)
          ? List.from((data['meta'] as Iterable).map<MailCustomMetadata>((meta) => MailCustomMetadata.fromMap(meta)))
          : [],
      acl: data['acl'] is Map ? Acl.fromMap(data['acl']) : null,
      subFolders: (data['folder'] is Iterable)
          ? List.from((data['folder'] as Iterable).map<Folder>((folder) => Folder.fromMap(folder)))
          : [],
      mountpoints: (data['link'] is Iterable)
          ? List.from((data['link'] as Iterable).map<Mountpoint>((link) => Mountpoint.fromMap(link)))
          : [],
      searchFolders: (data['search'] is Iterable)
          ? List.from((data['search'] as Iterable).map<SearchFolder>((search) => SearchFolder.fromMap(search)))
          : [],
      retentionPolicy: data['retentionPolicy']?[0] is Map ? RetentionPolicy.fromMap(data['retentionPolicy'][0]) : null);

  Map<String, dynamic> toMap() => {
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
        if (metadatas.isNotEmpty) 'meta': metadatas.map((meta) => meta.toMap()).toList(),
        if (acl != null) 'acl': acl!.toMap(),
        if (subFolders.isNotEmpty) 'folder': subFolders.map((folder) => folder.toMap()).toList(),
        if (mountpoints.isNotEmpty) 'link': mountpoints.map((link) => link.toMap()).toList(),
        if (searchFolders.isNotEmpty) 'search': searchFolders.map((search) => search.toMap()).toList(),
        if (retentionPolicy != null) 'retentionPolicy': retentionPolicy!.toMap(),
      };
}
