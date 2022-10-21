// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'acl.dart';
import 'common_document_info.dart';
import 'mail_custom_metadata.dart';

class DocumentInfo extends CommonDocumentInfo {
  /// Lock owner account ID
  final String? lockOwnerId;

  /// Lock owner account email address
  final String? lockOwnerEmail;

  /// Lock timestamp
  final String? lockOwnerTimestamp;

  DocumentInfo(
      {this.lockOwnerId,
      this.lockOwnerEmail,
      this.lockOwnerTimestamp,
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

  factory DocumentInfo.fromJson(Map<String, dynamic> json) => DocumentInfo(
      lockOwnerId: json['loid'],
      lockOwnerEmail: json['loe'],
      lockOwnerTimestamp: json['lt'],
      id: json['id'],
      uuid: json['uuid'],
      name: json['name'],
      size: json['s'],
      date: json['d'],
      folderId: json['l'],
      folderUuid: json['luuid'],
      modifiedSequence: json['ms'],
      metadataVersion: json['mdver'],
      changeDate: json['md'],
      revision: json['rev'],
      flags: json['f'],
      tags: json['t'],
      tagNames: json['tn'],
      description: json['desc'],
      contentType: json['ct'],
      descEnabled: json['descEnabled'],
      version: json['ver'],
      lastEditedBy: json['leb'],
      creator: json['cr'],
      createdDate: json['cd'],
      metadatas: (json['meta'] is Iterable)
          ? List.from((json['meta'] as Iterable).map<MailCustomMetadata>((meta) => MailCustomMetadata.fromJson(meta)))
          : [],
      fragment: json['fr']?['_content'],
      acl: (json['acl'] is Map) ? Acl.fromJson(json['acl']) : null);

  @override
  Map<String, dynamic> toJson() => {
        if (lockOwnerId != null) 'loid': lockOwnerId,
        if (lockOwnerEmail != null) 'loe': lockOwnerEmail,
        if (lockOwnerTimestamp != null) 'lt': lockOwnerTimestamp,
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
        if (metadatas.isNotEmpty) 'meta': metadatas.map((meta) => meta.toJson()).toList(),
        if (fragment != null) 'fr': {'_content': fragment},
        if (acl != null) 'acl': acl!.toJson(),
      };
}
