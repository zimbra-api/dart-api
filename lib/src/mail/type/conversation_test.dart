// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/where_setting.dart';

import 'filter_test.dart';

class ConversationTest extends FilterTest {
  /// Where setting - started|participated
  final WhereSetting? where;

  ConversationTest({this.where, super.index, super.negative});

  factory ConversationTest.fromJson(Map<String, dynamic> json) => ConversationTest(
      where: WhereSetting.values.firstWhere(
        (where) => where.name == json['where'],
        orElse: () => WhereSetting.started,
      ),
      index: json['index'],
      negative: json['negative']);

  @override
  Map<String, dynamic> toJson() => {
        if (where != null) 'where': where!.name,
        if (index != null) 'index': index,
        if (negative != null) 'negative': negative,
      };
}