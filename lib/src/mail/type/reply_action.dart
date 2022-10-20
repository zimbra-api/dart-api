// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'filter_action.dart';

class ReplyAction extends FilterAction {
  /// Reply content
  final String? content;

  ReplyAction({this.content, super.index});

  factory ReplyAction.fromJson(Map<String, dynamic> json) =>
      ReplyAction(content: json['content']?['_content'], index: json['index']);

  @override
  Map<String, dynamic> toJson() => {
        if (content != null) 'content': {'_content': content},
        if (index != null) 'index': index,
      };
}
