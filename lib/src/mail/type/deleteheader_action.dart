// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'editheader_test.dart';
import 'filter_action.dart';

class DeleteheaderAction extends FilterAction {
  /// if true start from last
  final bool? last;

  /// offset
  final int? offset;

  /// tests
  final EditheaderTest? test;

  const DeleteheaderAction({this.last, this.offset, this.test, super.index});

  factory DeleteheaderAction.fromMap(
    Map<String, dynamic> data,
  ) =>
      DeleteheaderAction(
        last: data['last'],
        offset: int.tryParse(data['offset']?.toString() ?? ''),
        test: data['test'] is Map ? EditheaderTest.fromMap(data['test']) : null,
        index: int.tryParse(data['index']?.toString() ?? ''),
      );

  @override
  Map<String, dynamic> toMap() => {
        if (last != null) 'last': last,
        if (offset != null) 'offset': offset,
        if (test != null) 'test': test!.toMap(),
        if (index != null) 'index': index,
      };
}
