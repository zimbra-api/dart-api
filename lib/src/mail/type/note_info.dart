// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'mail_custom_metadata.dart';

/// A note info
class NoteInfo {
  /// The id
  final String? id;

  /// Revision
  final int? revision;

  /// Folder ID
  final String? folder;

  /// Date
  final int? date;

  /// Flags
  final String? flags;

  /// Tags - Comma separated list of ints.  DEPRECATED - use "tn" instead
  final String? tags;

  /// Comma-separated list of tag names
  final String? tagNames;

  /// Bounds - x,y[width,height] where x,y,width and height are all ints
  final String? bounds;

  /// Color numeric; range 0-127; defaults to 0 if not present; client can display only 0-7
  final int? color;

  /// RGB color in format #rrggbb where r,g and b are hex digits
  final String? rgb;

  /// Modified date in seconds
  final int? changeDate;

  /// Modified sequence
  final int? modifiedSequence;

  /// Content
  final String? content;

  /// Custom metadata information
  final List<MailCustomMetadata> metadatas;

  NoteInfo(
      {this.id,
      this.revision,
      this.folder,
      this.date,
      this.flags,
      this.tags,
      this.tagNames,
      this.bounds,
      this.color,
      this.rgb,
      this.changeDate,
      this.modifiedSequence,
      this.content,
      this.metadatas = const []});

  factory NoteInfo.fromMap(Map<String, dynamic> data) => NoteInfo(
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

  Map<String, dynamic> toMap() => {
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
