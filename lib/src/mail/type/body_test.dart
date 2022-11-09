// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'filter_test.dart';

class BodyTest extends FilterTest {
  /// Value
  final String? value;

  /// Case sensitive setting
  final bool? caseSensitive;

  BodyTest({this.value, this.caseSensitive, super.index, super.negative});

  factory BodyTest.fromMap(Map<String, dynamic> data) => BodyTest(
      value: data['value'],
      caseSensitive: data['caseSensitive'],
      index: int.tryParse(data['index']?.toString() ?? ''),
      negative: data['negative']);

  @override
  Map<String, dynamic> toMap() => {
        if (value != null) 'value': value,
        if (caseSensitive != null) 'caseSensitive': caseSensitive,
        if (index != null) 'index': index,
        if (negative != null) 'negative': negative,
      };
}
