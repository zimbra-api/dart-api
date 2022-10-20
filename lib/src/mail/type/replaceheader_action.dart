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

  factory ReplaceheaderAction.fromJson(Map<String, dynamic> json) => ReplaceheaderAction(
      newName: json['newName']?['_content'],
      newValue: json['newValue']?['_content'],
      last: json['last'],
      offset: json['offset'],
      test: json['test'] is Map ? EditheaderTest.fromJson(json['test']) : null,
      index: json['index']);

  @override
  Map<String, dynamic> toJson() => {
        if (newName != null) 'newName': {'_content': newName},
        if (newValue != null) 'newValue': {'_content': newValue},
        if (last != null) 'last': last,
        if (last != null) 'last': last,
        if (offset != null) 'offset': offset,
        if (test != null) 'test': test!.toJson(),
        if (index != null) 'index': index,
      };
}
