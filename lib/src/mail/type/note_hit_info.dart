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

  factory NoteHitInfo.fromMap(Map<String, dynamic> data) => NoteHitInfo(
      sortField: data['sf'],
      id: data['id'],
      revision: data['rev'],
      folder: data['l'],
      date: data['d'],
      flags: data['f'],
      tags: data['t'],
      tagNames: data['tn'],
      bounds: data['pos'],
      color: data['color'],
      rgb: data['rgb'],
      changeDate: data['md'],
      modifiedSequence: data['ms'],
      content: data['content']?['_content'],
      metadatas: (data['meta'] is Iterable)
          ? List.from((data['meta'] as Iterable).map<MailCustomMetadata>((meta) => MailCustomMetadata.fromMap(meta)))
          : []);

  @override
  Map<String, dynamic> toMap() => {
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
        if (metadatas.isNotEmpty) 'meta': metadatas.map((meta) => meta.toMap()).toList(),
      };
}
