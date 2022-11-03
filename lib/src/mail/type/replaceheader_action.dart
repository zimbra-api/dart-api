// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'deleteheader_action.dart';
import 'editheader_test.dart';

class ReplaceheaderAction extends DeleteheaderAction {
  /// New name
  final String? newName;

  /// New value
  final String? newValue;

  ReplaceheaderAction({this.newName, this.newValue, super.last, super.offset, super.test, super.index});

  factory ReplaceheaderAction.fromMap(Map<String, dynamic> data) => ReplaceheaderAction(
      newName: data['newName']?['_content'],
      newValue: data['newValue']?['_content'],
      last: data['last'],
      offset: data['offset'],
      test: data['test'] is Map ? EditheaderTest.fromMap(data['test']) : null,
      index: data['index']);

  @override
  Map<String, dynamic> toMap() => {
        if (newName != null) 'newName': {'_content': newName},
        if (newValue != null) 'newValue': {'_content': newValue},
        if (last != null) 'last': last,
        if (offset != null) 'offset': offset,
        if (test != null) 'test': test!.toMap(),
        if (index != null) 'index': index,
      };
}
