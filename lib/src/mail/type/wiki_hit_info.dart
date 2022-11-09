// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'acl.dart';
import 'common_document_info.dart';
import 'mail_custom_metadata.dart';

class WikiHitInfo extends CommonDocumentInfo {
  /// Sort field value
  final String? sortField;

  WikiHitInfo(
      {this.sortField,
      super.id,
      super.uuid,
      super.name,
      super.size,
      super.date,
      super.folderId,
      super.folderUuid,
      super.modifiedSequence,
      super.metadataVersion,
      super.changeDate,
      super.revision,
      super.flags,
      super.tags,
      super.tagNames,
      super.description,
      super.contentType,
      super.descEnabled,
      super.version,
      super.lastEditedBy,
      super.creator,
      super.createdDate,
      super.metadatas = const [],
      super.fragment,
      super.acl});

  factory WikiHitInfo.fromMap(Map<String, dynamic> data) => WikiHitInfo(
      sortField: data['sf'],
      id: data['id'],
      uuid: data['uuid'],
      name: data['name'],
      size: int.tryParse(data['s']?.toString() ?? ''),
      date: int.tryParse(data['d']?.toString() ?? ''),
      folderId: data['l'],
      folderUuid: data['luuid'],
      modifiedSequence: int.tryParse(data['ms']?.toString() ?? ''),
      metadataVersion: int.tryParse(data['mdver']?.toString() ?? ''),
      changeDate: int.tryParse(data['md']?.toString() ?? ''),
      revision: int.tryParse(data['rev']?.toString() ?? ''),
      flags: data['f'],
      tags: data['t'],
      tagNames: data['tn'],
      description: data['desc'],
      contentType: data['ct'],
      descEnabled: data['descEnabled'],
      version: data['ver'],
      lastEditedBy: data['leb'],
      creator: data['cr'],
      createdDate: int.tryParse(data['cd']?.toString() ?? ''),
      metadatas: (data['meta'] is Iterable)
          ? List.from((data['meta'] as Iterable).map<MailCustomMetadata>((meta) => MailCustomMetadata.fromMap(meta)))
          : [],
      fragment: data['fr'],
      acl: (data['acl'] is Map) ? Acl.fromMap(data['acl']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (sortField != null) 'sf': sortField,
        if (id != null) 'id': id,
        if (uuid != null) 'uuid': uuid,
        if (name != null) 'name': name,
        if (size != null) 's': size,
        if (date != null) 'd': date,
        if (folderId != null) 'l': folderId,
        if (folderUuid != null) 'luuid': folderUuid,
        if (modifiedSequence != null) 'ms': modifiedSequence,
        if (metadataVersion != null) 'mdver': metadataVersion,
        if (changeDate != null) 'md': changeDate,
        if (revision != null) 'rev': revision,
        if (flags != null) 'f': flags,
        if (tags != null) 't': tags,
        if (tagNames != null) 'tn': tagNames,
        if (description != null) 'desc': description,
        if (contentType != null) 'ct': contentType,
        if (descEnabled != null) 'descEnabled': descEnabled,
        if (version != null) 'ver': version,
        if (lastEditedBy != null) 'leb': lastEditedBy,
        if (creator != null) 'cr': creator,
        if (createdDate != null) 'cd': createdDate,
        if (metadatas.isNotEmpty) 'meta': metadatas.map((meta) => meta.toMap()).toList(),
        if (fragment != null) 'fr': fragment,
        if (acl != null) 'acl': acl!.toMap(),
      };
}
