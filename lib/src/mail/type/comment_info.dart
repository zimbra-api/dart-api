// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'mail_custom_metadata.dart';

class CommentInfo {
  /// Item ID of parent
  final String? parentId;

  /// Item ID
  final String? id;

  /// Item's UUID - a globally unique identifier
  final String? uuid;

  /// Creator email address
  final String? creatorEmail;

  /// Flags
  final String? flags;

  /// Tags - Comma separated list of ints.  DEPRECATED - use "tn" instead
  final String? tags;

  /// Comma-separated list of tag names
  final String? tagNames;

  /// Color numeric; range 0-127; defaults to 0 if not present; client can display only 0-7
  final int? color;

  /// RGB color in format #rrggbb where r,g and b are hex digits
  final String? rgb;

  /// Timestamp
  final int? date;

  /// Metadata and the subject as text
  final List<MailCustomMetadata> metadatas;

  CommentInfo(
      {this.parentId,
      this.id,
      this.uuid,
      this.creatorEmail,
      this.flags,
      this.tags,
      this.tagNames,
      this.color,
      this.rgb,
      this.date,
      this.metadatas = const []});

  factory CommentInfo.fromJson(Map<String, dynamic> json) => CommentInfo(
      parentId: json['parentId'],
      id: json['id'],
      uuid: json['uuid'],
      creatorEmail: json['email'],
      flags: json['f'],
      tags: json['t'],
      tagNames: json['tn'],
      color: json['color'],
      rgb: json['rgb'],
      date: json['d'],
      metadatas: (json['meta'] is Iterable)
          ? List.from((json['meta'] as Iterable).map<MailCustomMetadata>((meta) => MailCustomMetadata.fromJson(meta)))
          : []);

  Map<String, dynamic> toJson() => {
        if (parentId != null) 'parentId': parentId,
        if (id != null) 'id': id,
        if (uuid != null) 'uuid': uuid,
        if (creatorEmail != null) 'email': creatorEmail,
        if (flags != null) 'f': flags,
        if (tags != null) 't': tags,
        if (tagNames != null) 'tn': tagNames,
        if (color != null) 'color': color,
        if (rgb != null) 'rgb': rgb,
        if (date != null) 'd': date,
        if (metadatas.isNotEmpty) 'meta': metadatas.map((meta) => meta.toJson()).toList(),
      };
}
