// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'filter_action.dart';

class TagAction extends FilterAction {
  /// Tag name
  final String? tag;

  TagAction({this.tag, super.index});

  factory TagAction.fromJson(Map<String, dynamic> json) => TagAction(tag: json['tagName'], index: json['index']);

  @override
  Map<String, dynamic> toJson() => {
        if (tag != null) 'tagName': tag,
        if (index != null) 'index': index,
      };
}
