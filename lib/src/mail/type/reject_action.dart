// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'filter_action.dart';

class RejectAction extends FilterAction {
  /// Reject content
  final String? content;

  RejectAction({this.content, super.index});

  factory RejectAction.fromJson(Map<String, dynamic> json) =>
      RejectAction(content: json['_content'], index: json['index']);

  @override
  Map<String, dynamic> toJson() => {
        if (content != null) '_content': content,
        if (index != null) 'index': index,
      };
}
