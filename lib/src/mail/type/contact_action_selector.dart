// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'action_selector.dart';
import 'new_contact_attr.dart';

/// Contact action selector
class ContactActionSelector extends ActionSelector {
  /// New contact attributes
  final List<NewContactAttr> attrs;

  ContactActionSelector(super.ids, super.operation,
      {super.constraint,
      super.tag,
      super.folder,
      super.rgb,
      super.color,
      super.name,
      super.flags,
      super.tags,
      super.tagNames,
      super.nonExistentIds,
      super.newlyCreatedIds,
      this.attrs = const []});

  factory ContactActionSelector.fromJson(Map<String, dynamic> json) =>
      ContactActionSelector(json['id'] ?? '', json['op'] ?? '',
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
          newlyCreatedIds: json['nci'],
          attrs: (json['attr'] is Iterable)
              ? List.from((json['attr'] as Iterable).map<NewContactAttr>((attr) => NewContactAttr.fromJson(attr)))
              : []);

  @override
  Map<String, dynamic> toJson() => {
        'id': ids,
        'op': operation,
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
        if (attrs.isNotEmpty) 'attr': attrs.map((attr) => attr.toJson()).toList(),
      };
}
