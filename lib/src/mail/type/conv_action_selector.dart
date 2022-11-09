// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'action_selector.dart';

/// Conversation action selector
class ConvActionSelector extends ActionSelector {
  /// In case of "move" operation, this attr can also be used to specify the target folder,
  /// in terms of the relative path from the account / data source's root folder.
  /// The target account / data source is identified based on where the messages in this conversation already reside.
  /// If a conversation contains messages belonging of multiple accounts / data sources then it would not be affected by this operation.
  final String? acctRelativePath;

  ConvActionSelector(super.ids, super.operation,
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
      this.acctRelativePath});

  factory ConvActionSelector.fromMap(Map<String, dynamic> data) =>
      ConvActionSelector(data['id'] ?? '', data['op'] ?? '',
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
          acctRelativePath: data['acctRelPath']?['_content']);

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
        if (acctRelativePath != null) 'acctRelPath': {'_content': acctRelativePath},
      };
}
