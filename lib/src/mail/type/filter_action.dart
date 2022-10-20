// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class FilterAction {
  /// Index - specifies a guaranteed order for the action elements
  final int? index;

  FilterAction({this.index});

  factory FilterAction.fromJson(Map<String, dynamic> json) => FilterAction(index: json['index']);

  Map<String, dynamic> toJson() => {
        if (index != null) 'index': index,
      };
}
