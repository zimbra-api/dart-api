// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class FilterAction {
  /// Index - specifies a guaranteed order for the action elements
  final int? index;

  FilterAction({this.index});

  factory FilterAction.fromMap(Map<String, dynamic> data) => FilterAction(index: data['index']);

  Map<String, dynamic> toMap() => {
        if (index != null) 'index': index,
      };
}
