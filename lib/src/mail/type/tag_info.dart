// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'mail_custom_metadata.dart';
import 'retention_policy.dart';

/// A tag info
class TagInfo {
  /// The folder id
  final String id;

  /// Tag name
  final String name;

  /// Color numeric; range 0-127; defaults to 0 if not present; client can display only 0-7
  final int? color;

  /// RGB color in format #rrggbb where r,g and b are hex digits
  final String? rgb;

  /// Unread count. Only present if value > 0
  final int? unread;

  /// Item count. Only present if value > 0
  final int? count;

  /// Date
  final int? date;

  /// Revision
  final int? revision;

  /// Modified date in seconds
  final int? changeDate;

  /// Modified sequence
  final int? modifiedSequence;

  /// Custom metadata
  final List<MailCustomMetadata> metadatas;

  /// Retention policy
  final RetentionPolicy? retentionPolicy;

  TagInfo(this.id, this.name,
      {this.color,
      this.rgb,
      this.unread,
      this.count,
      this.date,
      this.revision,
      this.changeDate,
      this.modifiedSequence,
      this.metadatas = const [],
      this.retentionPolicy});

  factory TagInfo.fromJson(Map<String, dynamic> json) => TagInfo(json['id'] ?? '', json['name'] ?? '',
      color: json['color'],
      rgb: json['rgb'],
      unread: json['u'],
      count: json['n'],
      date: json['d'],
      revision: json['rev'],
      changeDate: json['md'],
      modifiedSequence: json['ms'],
      metadatas: (json['meta'] is Iterable)
          ? List.from((json['meta'] as Iterable).map<MailCustomMetadata>((meta) => MailCustomMetadata.fromJson(meta)))
          : [],
      retentionPolicy: json['retentionPolicy'] is Map ? RetentionPolicy.fromJson(json['retentionPolicy']) : null);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        if (color != null) 'color': color,
        if (rgb != null) 'rgb': rgb,
        if (unread != null) 'u': unread,
        if (count != null) 'n': count,
        if (date != null) 'd': date,
        if (revision != null) 'rev': revision,
        if (changeDate != null) 'md': changeDate,
        if (modifiedSequence != null) 'ms': modifiedSequence,
        if (metadatas.isNotEmpty) 'meta': metadatas.map((meta) => meta.toJson()).toList(),
        if (retentionPolicy != null) 'retentionPolicy': retentionPolicy!.toJson(),
      };
}
