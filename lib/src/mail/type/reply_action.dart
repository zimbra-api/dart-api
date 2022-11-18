// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'filter_action.dart';

class ReplyAction extends FilterAction {
  /// Reply content
  final String? content;

  const ReplyAction({this.content, super.index});

  factory ReplyAction.fromMap(Map<String, dynamic> data) =>
      ReplyAction(content: data['content']?['_content'], index: int.tryParse(data['index']?.toString() ?? ''));

  @override
  Map<String, dynamic> toMap() => {
        if (content != null) 'content': {'_content': content},
        if (index != null) 'index': index,
      };
}
