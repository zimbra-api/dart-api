// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/importance.dart';

import 'filter_test.dart';

class ImportanceTest extends FilterTest {
  /// Importance - high|normal|low
  final Importance? importance;

  ImportanceTest({this.importance, super.index, super.negative});

  factory ImportanceTest.fromJson(Map<String, dynamic> json) => ImportanceTest(
      importance: Importance.values.firstWhere(
        (imp) => imp.name == json['imp'],
        orElse: () => Importance.normal,
      ),
      index: json['index'],
      negative: json['negative']);

  @override
  Map<String, dynamic> toJson() => {
        if (importance != null) 'imp': importance!.name,
        if (index != null) 'index': index,
        if (negative != null) 'negative': negative,
      };
}
