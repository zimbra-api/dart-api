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

  DeleteheaderAction({this.last, this.offset, this.test, super.index});

  factory DeleteheaderAction.fromJson(Map<String, dynamic> json) => DeleteheaderAction(
      last: json['last'],
      offset: json['offset'],
      test: json['test'] is Map ? EditheaderTest.fromJson(json['test']) : null,
      index: json['index']);

  @override
  Map<String, dynamic> toJson() => {
        if (last != null) 'last': last,
        if (offset != null) 'offset': offset,
        if (test != null) 'test': test!.toJson(),
        if (index != null) 'index': index,
      };
}
