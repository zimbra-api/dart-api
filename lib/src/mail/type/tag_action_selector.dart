// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'action_selector.dart';
import 'retention_policy.dart';

class TagActionSelector extends ActionSelector {
  /// Retention policy
  final RetentionPolicy? retentionPolicy;

  const TagActionSelector(
    super.ids,
    super.operation, {
    this.retentionPolicy,
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
    super.newlyCreatedIds,
  });

  factory TagActionSelector.fromMap(Map<String, dynamic> data) => TagActionSelector(data['id'] ?? '', data['op'] ?? '',
      retentionPolicy: data['retentionPolicy']?[0] is Map ? RetentionPolicy.fromMap(data['retentionPolicy'][0]) : null,
      constraint: data['tcon'],
      tag: data['tag'],
      folder: data['l'],
      rgb: data['rgb'],
      color: int.tryParse(data['color']?.toString() ?? ''),
      name: data['name'],
      flags: data['f'],
      tags: data['t'],
      tagNames: data['tn'],
      nonExistentIds: data['nei'],
      newlyCreatedIds: data['nci']);

  @override
  Map<String, dynamic> toMap() => {
        'id': ids,
        'op': operation,
        if (retentionPolicy != null) 'retentionPolicy': retentionPolicy!.toMap(),
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
