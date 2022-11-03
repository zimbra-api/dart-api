// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/date_comparison.dart';

import 'filter_test.dart';

class DateTest extends FilterTest {
  /// Date comparison setting - before|after
  final DateComparison? dateComparison;

  /// Date
  final int? date;

  DateTest({this.dateComparison, this.date, super.index, super.negative});

  factory DateTest.fromMap(Map<String, dynamic> data) => DateTest(
      dateComparison: DateComparison.values.firstWhere(
        (dateComparison) => dateComparison.name == data['dateComparison'],
        orElse: () => DateComparison.before,
      ),
      date: data['date'],
      index: data['index'],
      negative: data['negative']);

  @override
  Map<String, dynamic> toMap() => {
        if (dateComparison != null) 'dateComparison': dateComparison!.name,
        if (date != null) 'date': date,
        if (index != null) 'index': index,
        if (negative != null) 'negative': negative,
      };
}
