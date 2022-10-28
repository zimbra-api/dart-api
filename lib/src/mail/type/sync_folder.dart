// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/view_type.dart';

import 'acl.dart';
import 'folder.dart';
import 'ids_attr.dart';
import 'mail_custom_metadata.dart';
import 'mountpoint.dart';
import 'retention_policy.dart';
import 'search_folder.dart';

class SyncFolder extends Folder {
  /// list of tag ids in the folder
  final List<IdsAttr> tagItemIds;

  /// list of conv ids in the folder
  final List<IdsAttr> convItemIds;

  /// list of chat ids in the folder
  final List<IdsAttr> chatItemIds;

  /// list of msg ids in the folder
  final List<IdsAttr> msgItemIds;

  /// list of contact ids in the folder
  final List<IdsAttr> contactItemIds;

  /// list of appt ids in the folder
  final List<IdsAttr> apptItemIds;

  /// list of task ids in the folder
  final List<IdsAttr> taskItemIds;

  /// list of note ids in the folder
  final List<IdsAttr> noteItemIds;

  /// list of wiki ids in the folder
  final List<IdsAttr> wikiItemIds;

  /// list of doc ids in the folder
  final List<IdsAttr> docItemIds;

  SyncFolder(
      {this.tagItemIds = const [],
      this.convItemIds = const [],
      this.chatItemIds = const [],
      this.msgItemIds = const [],
      this.contactItemIds = const [],
      this.apptItemIds = const [],
      this.taskItemIds = const [],
      this.noteItemIds = const [],
      this.wikiItemIds = const [],
      this.docItemIds = const [],
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

  factory SyncFolder.fromJson(Map<String, dynamic> json) => SyncFolder(
      tagItemIds: (json['tag'] is Iterable)
          ? List.from((json['tag'] as Iterable).map<IdsAttr>((tag) => IdsAttr.fromJson(tag)))
          : [],
      convItemIds: (json['c'] is Iterable)
          ? List.from((json['c'] as Iterable).map<IdsAttr>((conv) => IdsAttr.fromJson(conv)))
          : [],
      chatItemIds: (json['chat'] is Iterable)
          ? List.from((json['chat'] as Iterable).map<IdsAttr>((chat) => IdsAttr.fromJson(chat)))
          : [],
      msgItemIds: (json['m'] is Iterable)
          ? List.from((json['m'] as Iterable).map<IdsAttr>((msg) => IdsAttr.fromJson(msg)))
          : [],
      contactItemIds: (json['cn'] is Iterable)
          ? List.from((json['cn'] as Iterable).map<IdsAttr>((cn) => IdsAttr.fromJson(cn)))
          : [],
      apptItemIds: (json['appt'] is Iterable)
          ? List.from((json['appt'] as Iterable).map<IdsAttr>((appt) => IdsAttr.fromJson(appt)))
          : [],
      taskItemIds: (json['task'] is Iterable)
          ? List.from((json['task'] as Iterable).map<IdsAttr>((task) => IdsAttr.fromJson(task)))
          : [],
      noteItemIds: (json['notes'] is Iterable)
          ? List.from((json['notes'] as Iterable).map<IdsAttr>((note) => IdsAttr.fromJson(note)))
          : [],
      wikiItemIds: (json['w'] is Iterable)
          ? List.from((json['w'] as Iterable).map<IdsAttr>((wiki) => IdsAttr.fromJson(wiki)))
          : [],
      docItemIds: (json['doc'] is Iterable)
          ? List.from((json['doc'] as Iterable).map<IdsAttr>((doc) => IdsAttr.fromJson(doc)))
          : [],
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
        orElse: () => ViewType.message,
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
        if (tagItemIds.isNotEmpty) 'tag': tagItemIds.map((tag) => tag.toJson()).toList(),
        if (convItemIds.isNotEmpty) 'c': convItemIds.map((conv) => conv.toJson()).toList(),
        if (chatItemIds.isNotEmpty) 'chat': chatItemIds.map((chat) => chat.toJson()).toList(),
        if (msgItemIds.isNotEmpty) 'm': msgItemIds.map((msg) => msg.toJson()).toList(),
        if (contactItemIds.isNotEmpty) 'cn': contactItemIds.map((cn) => cn.toJson()).toList(),
        if (apptItemIds.isNotEmpty) 'appt': apptItemIds.map((appt) => appt.toJson()).toList(),
        if (taskItemIds.isNotEmpty) 'task': taskItemIds.map((task) => task.toJson()).toList(),
        if (noteItemIds.isNotEmpty) 'notes': noteItemIds.map((note) => note.toJson()).toList(),
        if (wikiItemIds.isNotEmpty) 'w': wikiItemIds.map((wiki) => wiki.toJson()).toList(),
        if (docItemIds.isNotEmpty) 'doc': docItemIds.map((doc) => doc.toJson()).toList(),
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
