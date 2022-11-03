// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/id.dart';

import 'id_version.dart';
import 'message_part_spec.dart';

class DocumentSpec {
  /// File name
  final String? name;

  /// Content type
  final String? contentType;

  /// Absolute folder path
  final String? description;

  /// Folder ID
  final String? folderId;

  /// Item ID
  final String? id;

  /// Last known version
  final int? version;

  /// Inlined document content string
  final String? content;

  /// Active sync status
  final bool? descEnabled;

  /// Flags - Any of the flags specified in soap.txt, with the addition of 't',
  /// which specifies that the document is a note.
  final String? flags;

  /// Upload specification
  final Id? upload;

  /// Message part specification
  final MessagePartSpec? messagePart;

  /// Information on document version to restore to
  final IdVersion? docRevision;

  DocumentSpec(
      {this.name,
      this.contentType,
      this.description,
      this.folderId,
      this.id,
      this.version,
      this.content,
      this.descEnabled,
      this.flags,
      this.upload,
      this.messagePart,
      this.docRevision});

  factory DocumentSpec.fromMap(Map<String, dynamic> data) => DocumentSpec(
        name: data['name'],
        contentType: data['ct'],
        description: data['desc'],
        folderId: data['l'],
        id: data['id'],
        version: data['ver'],
        content: data['content'],
        descEnabled: data['descEnabled'],
        flags: data['f'],
        upload: (data['upload'] is Map) ? Id.fromMap(data['upload']) : null,
        messagePart: (data['m'] is Map) ? MessagePartSpec.fromMap(data['m']) : null,
        docRevision: (data['doc'] is Map) ? IdVersion.fromMap(data['doc']) : null,
      );

  Map<String, dynamic> toMap() => {
        if (name != null) 'name': name,
        if (contentType != null) 'ct': contentType,
        if (description != null) 'desc': description,
        if (folderId != null) 'l': folderId,
        if (id != null) 'id': id,
        if (version != null) 'ver': version,
        if (content != null) 'content': content,
        if (descEnabled != null) 'descEnabled': descEnabled,
        if (flags != null) 'f': flags,
        if (upload != null) 'upload': upload!.toMap(),
        if (messagePart != null) 'm': messagePart!.toMap(),
        if (docRevision != null) 'doc': docRevision!.toMap(),
      };
}
