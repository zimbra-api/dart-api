// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'mail_custom_metadata.dart';
import 'note_info.dart';

class NoteHitInfo extends NoteInfo {
  /// Sort field value
  final String? sortField;

  const NoteHitInfo({
    this.sortField,
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
    super.metadatas = const [],
  });

  factory NoteHitInfo.fromMap(Map<String, dynamic> data) => NoteHitInfo(
      sortField: data['sf'],
      id: data['id'],
      revision: int.tryParse(data['rev']?.toString() ?? ''),
      folder: data['l'],
      date: int.tryParse(data['d']?.toString() ?? ''),
      flags: data['f'],
      tags: data['t'],
      tagNames: data['tn'],
      bounds: data['pos'],
      color: int.tryParse(data['color']?.toString() ?? ''),
      rgb: data['rgb'],
      changeDate: int.tryParse(data['md']?.toString() ?? ''),
      modifiedSequence: int.tryParse(data['ms']?.toString() ?? ''),
      content: data['content'],
      metadatas: (data['meta'] is Iterable)
          ? (data['meta'] as Iterable)
              .map<MailCustomMetadata>((meta) => MailCustomMetadata.fromMap(meta))
              .toList(growable: false)
          : const []);

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
        if (content != null) 'content': content,
        if (metadatas.isNotEmpty) 'meta': metadatas.map((meta) => meta.toMap()).toList(growable: false),
      };
}
