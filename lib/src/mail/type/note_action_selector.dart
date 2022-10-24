// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'action_selector.dart';

class NoteActionSelector extends ActionSelector {
  /// Content
  final String? content;

  /// Bounds - x,y[width,height] where x,y,width and height are all ints
  final String? bounds;

  NoteActionSelector(super.ids, super.operation,
      {this.content,
      this.bounds,
      super.constraint,
      super.tag,
      super.folder,
      super.rgb,
      super.color,
      super.name,
      super.flags,
      super.tags,
      super.tagNames,
      super.nonExistentIds,
      super.newlyCreatedIds});

  factory NoteActionSelector.fromJson(Map<String, dynamic> json) =>
      NoteActionSelector(json['id'] ?? '', json['op'] ?? '',
          content: json['content'],
          bounds: json['pos'],
          constraint: json['tcon'],
          tag: json['tag'],
          folder: json['l'],
          rgb: json['rgb'],
          color: json['color'],
          name: json['name'],
          flags: json['f'],
          tags: json['t'],
          tagNames: json['tn'],
          nonExistentIds: json['nei'],
          newlyCreatedIds: json['nci']);

  @override
  Map<String, dynamic> toJson() => {
        'id': ids,
        'op': operation,
        if (content != null) 'content': content,
        if (bounds != null) 'pos': bounds,
        if (constraint != null) 'tcon': constraint,
        if (tag != null) 'tag': tag,
        if (folder != null) 'l': folder,
        if (rgb != null) 'rgb': rgb,
        if (color != null) 'color': color,
        if (name != null) 'name': name,
        if (flags != null) 'f': flags,
        if (tags != null) 't': tags,
        if (tagNames != null) 'tn': tagNames,
        if (nonExistentIds != null) 'nei': nonExistentIds,
        if (newlyCreatedIds != null) 'nci': newlyCreatedIds,
      };
}
