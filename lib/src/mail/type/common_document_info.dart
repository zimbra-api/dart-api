// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'acl.dart';
import 'mail_custom_metadata.dart';

class CommonDocumentInfo {
  /// Document ID
  final String? id;

  /// Item's UUID - a globally unique identifier
  final String? uuid;

  /// Name
  final String? name;

  /// Size
  final int? size;

  /// Date the item's content was last modified in milliseconds since 1970-01-01 00:00:00 UTC.
  /// For immutable objects (e.g. received messages), this will be the same as the date the item was created.
  final int? date;

  /// Folder ID
  final String? folderId;

  /// Folder UUID
  final String? folderUuid;

  /// Modified sequence
  final int? modifiedSequence;

  /// Metadata version
  final int? metadataVersion;

  /// The date the item's metadata and/or content was last modified in seconds since 1970-01-01 00:00:00 UTC.
  final int? changeDate;

  /// Revision
  final int? revision;

  /// Flags
  final String? flags;

  /// Tags - Comma separated list of ints.  DEPRECATED - use "tn" instead
  final String? tags;

  /// Comma-separated list of tag names
  final String? tagNames;

  /// Optional description
  final String? description;

  /// Content type
  final String? contentType;

  /// Flags whether description is enabled or not
  final bool? descEnabled;

  /// Version
  final int? version;

  /// Last edited by
  final String? lastEditedBy;

  /// Revision creator
  final String? creator;

  /// Revision creation date in milliseconds since 1970-01-01 00:00:00 UTC.
  final int? createdDate;

  /// Custom metadata information
  final List<MailCustomMetadata> metadatas;

  /// First few bytes of the message (probably between 40 and 100 bytes)
  final String? fragment;

  /// ACL for sharing
  final Acl? acl;

  CommonDocumentInfo(
      {this.id,
      this.uuid,
      this.name,
      this.size,
      this.date,
      this.folderId,
      this.folderUuid,
      this.modifiedSequence,
      this.metadataVersion,
      this.changeDate,
      this.revision,
      this.flags,
      this.tags,
      this.tagNames,
      this.description,
      this.contentType,
      this.descEnabled,
      this.version,
      this.lastEditedBy,
      this.creator,
      this.createdDate,
      this.metadatas = const [],
      this.fragment,
      this.acl});

  factory CommonDocumentInfo.fromMap(Map<String, dynamic> data) => CommonDocumentInfo(
      id: data['id'],
      uuid: data['uuid'],
      name: data['name'],
      size: data['s'],
      date: data['d'],
      folderId: data['l'],
      folderUuid: data['luuid'],
      modifiedSequence: data['ms'],
      metadataVersion: data['mdver'],
      changeDate: data['md'],
      revision: data['rev'],
      flags: data['f'],
      tags: data['t'],
      tagNames: data['tn'],
      description: data['desc'],
      contentType: data['ct'],
      descEnabled: data['descEnabled'],
      version: data['ver'],
      lastEditedBy: data['leb'],
      creator: data['cr'],
      createdDate: data['cd'],
      metadatas: (data['meta'] is Iterable)
          ? List.from((data['meta'] as Iterable).map<MailCustomMetadata>((meta) => MailCustomMetadata.fromMap(meta)))
          : [],
      fragment: data['fr']?['_content'],
      acl: (data['acl'] is Map) ? Acl.fromMap(data['acl']) : null);

  Map<String, dynamic> toMap() => {
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
        if (fragment != null) 'fr': {'_content': fragment},
        if (acl != null) 'acl': acl!.toMap(),
      };
}
