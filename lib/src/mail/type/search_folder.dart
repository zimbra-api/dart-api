// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/search_sort_by.dart';
import 'package:zimbra_api/src/common/enum/view_type.dart';

import 'acl.dart';
import 'folder.dart';
import 'mail_custom_metadata.dart';
import 'mountpoint.dart';
import 'retention_policy.dart';

class SearchFolder extends Folder {
  // Query string
  final String? query;

  /// Sort by
  final SearchSortBy? sortBy;

  /// Comma-separated list. Legal values in list are:
  /// appointment|chat|contact|conversation|document|message|tag|task|wiki
  final String? types;

  SearchFolder(
      {this.query,
      this.sortBy,
      this.types,
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

  factory SearchFolder.fromMap(Map<String, dynamic> data) => SearchFolder(
      query: data['query'],
      sortBy: SearchSortBy.values.firstWhere(
        (view) => view.name == data['view'],
        orElse: () => SearchSortBy.none,
      ),
      types: data['types'],
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
      retentionPolicy: data['retentionPolicy'] is Map ? RetentionPolicy.fromMap(data['retentionPolicy']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (query != null) 'query': query,
        if (sortBy != null) 'sortBy': sortBy!.name,
        if (types != null) 'types': types,
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
