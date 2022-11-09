// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/date_comparison.dart';

import 'filter_test.dart';

class CurrentTimeTest extends FilterTest {
  /// Date comparison setting - before|after
  final DateComparison? dateComparison;

  /// Time in HHmm format
  final String? time;

  CurrentTimeTest({this.dateComparison, this.time, super.index, super.negative});

  factory CurrentTimeTest.fromMap(Map<String, dynamic> data) => CurrentTimeTest(
      dateComparison: DateComparison.values.firstWhere(
        (dateComparison) => dateComparison.name == data['dateComparison'],
        orElse: () => DateComparison.before,
      ),
      time: data['time'],
      index: int.tryParse(data['index']?.toString() ?? ''),
      negative: data['negative']);

  @override
  Map<String, dynamic> toMap() => {
        if (dateComparison != null) 'dateComparison': dateComparison!.name,
        if (time != null) 'time': time,
        if (index != null) 'index': index,
        if (negative != null) 'negative': negative,
      };
}
