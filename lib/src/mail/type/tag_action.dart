// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'filter_action.dart';

class TagAction extends FilterAction {
  /// Tag name
  final String? tag;

  const TagAction({this.tag, super.index});

  factory TagAction.fromMap(Map<String, dynamic> data) => TagAction(
        tag: data['tagName'],
        index: int.tryParse(data['index']?.toString() ?? ''),
      );

  @override
  Map<String, dynamic> toMap() => {
        if (tag != null) 'tagName': tag,
        if (index != null) 'index': index,
      };
}
