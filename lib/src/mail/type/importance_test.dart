// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/importance.dart';

import 'filter_test.dart';

class ImportanceTest extends FilterTest {
  /// Importance - high|normal|low
  final Importance? importance;

  ImportanceTest({this.importance, super.index, super.negative});

  factory ImportanceTest.fromMap(Map<String, dynamic> data) => ImportanceTest(
      importance: Importance.values.firstWhere(
        (imp) => imp.name == data['imp'],
        orElse: () => Importance.normal,
      ),
      index: int.tryParse(data['index']?.toString() ?? ''),
      negative: data['negative']);

  @override
  Map<String, dynamic> toMap() => {
        if (importance != null) 'imp': importance!.name,
        if (index != null) 'index': index,
        if (negative != null) 'negative': negative,
      };
}
