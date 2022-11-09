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

  factory ContactActionSelector.fromMap(Map<String, dynamic> data) =>
      ContactActionSelector(data['id'] ?? '', data['op'] ?? '',
          constraint: data['tcon'],
          tag: int.tryParse(data['tag']?.toString() ?? ''),
          folder: data['l'],
          rgb: data['rgb'],
          color: int.tryParse(data['color']?.toString() ?? ''),
          name: data['name'],
          flags: data['f'],
          tags: data['t'],
          tagNames: data['tn'],
          nonExistentIds: data['nei'],
          newlyCreatedIds: data['nci'],
          attrs: (data['attr'] is Iterable)
              ? List.from((data['attr'] as Iterable).map<NewContactAttr>((attr) => NewContactAttr.fromMap(attr)))
              : []);

  @override
  Map<String, dynamic> toMap() => {
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
        if (attrs.isNotEmpty) 'attr': attrs.map((attr) => attr.toMap()).toList(),
      };
}
