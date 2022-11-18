// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'filter_test.dart';

class CurrentDayOfWeekTest extends FilterTest {
  /// Comma separated day of week indices
  final String? values;

  const CurrentDayOfWeekTest({this.values, super.index, super.negative});

  factory CurrentDayOfWeekTest.fromMap(Map<String, dynamic> data) =>
      CurrentDayOfWeekTest(values: data['value'], index: data['index'], negative: data['negative']);

  @override
  Map<String, dynamic> toMap() => {
        if (values != null) 'value': values,
        if (index != null) 'index': index,
        if (negative != null) 'negative': negative,
      };
}
