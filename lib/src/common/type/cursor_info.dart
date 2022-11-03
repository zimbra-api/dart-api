// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class CursorInfo {
  final String? id;

  final String? sortVal;

  final String? endSortVal;

  final bool? includeOffset;

  CursorInfo({this.id, this.sortVal, this.endSortVal, this.includeOffset});

  factory CursorInfo.fromMap(Map<String, dynamic> data) => CursorInfo(
        id: data['id'],
        sortVal: data['sortVal'],
        endSortVal: data['endSortVal'],
        includeOffset: data['includeOffset'],
      );

  Map<String, dynamic> toMap() => {
        if (id != null) 'id': id,
        if (sortVal != null) 'sortVal': sortVal,
        if (endSortVal != null) 'endSortVal': endSortVal,
        if (includeOffset != null) 'includeOffset': includeOffset,
      };
}
