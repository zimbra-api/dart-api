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

  factory SyncFolder.fromMap(Map<String, dynamic> data) => SyncFolder(
      tagItemIds: (data['tag'] is Iterable)
          ? (data['tag'] as Iterable).map<IdsAttr>((tag) => IdsAttr.fromMap(tag)).toList(growable: false)
          : const [],
      convItemIds: (data['c'] is Iterable)
          ? (data['c'] as Iterable).map<IdsAttr>((conv) => IdsAttr.fromMap(conv)).toList(growable: false)
          : const [],
      chatItemIds: (data['chat'] is Iterable)
          ? (data['chat'] as Iterable).map<IdsAttr>((chat) => IdsAttr.fromMap(chat)).toList(growable: false)
          : const [],
      msgItemIds: (data['m'] is Iterable)
          ? (data['m'] as Iterable).map<IdsAttr>((msg) => IdsAttr.fromMap(msg)).toList(growable: false)
          : const [],
      contactItemIds: (data['cn'] is Iterable)
          ? (data['cn'] as Iterable).map<IdsAttr>((cn) => IdsAttr.fromMap(cn)).toList(growable: false)
          : const [],
      apptItemIds: (data['appt'] is Iterable)
          ? (data['appt'] as Iterable).map<IdsAttr>((appt) => IdsAttr.fromMap(appt)).toList(growable: false)
          : const [],
      taskItemIds: (data['task'] is Iterable)
          ? (data['task'] as Iterable).map<IdsAttr>((task) => IdsAttr.fromMap(task)).toList(growable: false)
          : const [],
      noteItemIds: (data['notes'] is Iterable)
          ? (data['notes'] as Iterable).map<IdsAttr>((note) => IdsAttr.fromMap(note)).toList(growable: false)
          : const [],
      wikiItemIds: (data['w'] is Iterable)
          ? (data['w'] as Iterable).map<IdsAttr>((wiki) => IdsAttr.fromMap(wiki)).toList(growable: false)
          : const [],
      docItemIds: (data['doc'] is Iterable)
          ? (data['doc'] as Iterable).map<IdsAttr>((doc) => IdsAttr.fromMap(doc)).toList(growable: false)
          : const [],
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
        orElse: () => ViewType.message,
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
        if (tagItemIds.isNotEmpty) 'tag': tagItemIds.map((tag) => tag.toMap()).toList(growable: false),
        if (convItemIds.isNotEmpty) 'c': convItemIds.map((conv) => conv.toMap()).toList(growable: false),
        if (chatItemIds.isNotEmpty) 'chat': chatItemIds.map((chat) => chat.toMap()).toList(growable: false),
        if (msgItemIds.isNotEmpty) 'm': msgItemIds.map((msg) => msg.toMap()).toList(growable: false),
        if (contactItemIds.isNotEmpty) 'cn': contactItemIds.map((cn) => cn.toMap()).toList(growable: false),
        if (apptItemIds.isNotEmpty) 'appt': apptItemIds.map((appt) => appt.toMap()).toList(growable: false),
        if (taskItemIds.isNotEmpty) 'task': taskItemIds.map((task) => task.toMap()).toList(growable: false),
        if (noteItemIds.isNotEmpty) 'notes': noteItemIds.map((note) => note.toMap()).toList(growable: false),
        if (wikiItemIds.isNotEmpty) 'w': wikiItemIds.map((wiki) => wiki.toMap()).toList(growable: false),
        if (docItemIds.isNotEmpty) 'doc': docItemIds.map((doc) => doc.toMap()).toList(growable: false),
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
