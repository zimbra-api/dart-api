// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'mail_custom_metadata.dart';
import 'note_info.dart';

class NoteHitInfo extends NoteInfo {
  /// Sort field value
  final String? sortField;

  NoteHitInfo(
      {this.sortField,
      super.id,
      super.revision,
      super.folder,
      super.date,
      super.flags,
      super.tags,
      super.tagNames,
      super.bounds,
      super.color,
      super.rgb,
      super.changeDate,
      super.modifiedSequence,
      super.content,
      super.metadatas = const []});

  factory NoteHitInfo.fromJson(Map<String, dynamic> json) => NoteHitInfo(
      sortField: json['sf'],
      id: json['id'],
      revision: json['rev'],
      folder: json['l'],
      date: json['d'],
      flags: json['f'],
      tags: json['t'],
      tagNames: json['tn'],
      bounds: json['pos'],
      color: json['color'],
      rgb: json['rgb'],
      changeDate: json['md'],
      modifiedSequence: json['ms'],
      content: json['content']?['_content'],
      metadatas: (json['meta'] is Iterable)
          ? List.from((json['meta'] as Iterable).map<MailCustomMetadata>((meta) => MailCustomMetadata.fromJson(meta)))
          : []);

  @override
  Map<String, dynamic> toJson() => {
        if (sortField != null) 'sf': sortField,
        if (id != null) 'id': id,
        if (revision != null) 'rev': revision,
        if (folder != null) 'l': folder,
        if (date != null) 'd': date,
        if (flags != null) 'f': flags,
        if (tags != null) 't': tags,
        if (tagNames != null) 'tn': tagNames,
        if (bounds != null) 'pos': bounds,
        if (color != null) 'color': color,
        if (rgb != null) 'rgb': rgb,
        if (changeDate != null) 'md': changeDate,
        if (modifiedSequence != null) 'ms': modifiedSequence,
        if (content != null) 'content': {'_content': content},
        if (metadatas.isNotEmpty) 'meta': metadatas.map((meta) => meta.toJson()).toList(),
      };
}
