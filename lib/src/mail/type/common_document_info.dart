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

  factory CommonDocumentInfo.fromJson(Map<String, dynamic> json) => CommonDocumentInfo(
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

  Map<String, dynamic> toJson() => {
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
