// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/enum/string_comparison.dart';
import 'filter_test.dart';

class MimeHeaderTest extends FilterTest {
  /// Comma separated list of header names
  final String? headers;

  /// String comparison type - is|contains|matches
  final StringComparison? stringComparison;

  /// Value
  final String? value;

  /// Case sensitive setting
  final bool? caseSensitive;

  const MimeHeaderTest({
    this.headers,
    this.stringComparison,
    this.value,
    this.caseSensitive,
    super.index,
    super.negative,
  });

  factory MimeHeaderTest.fromMap(Map<String, dynamic> data) => MimeHeaderTest(
        headers: data['header'],
        stringComparison: StringComparison.values.firstWhere(
          (comparison) => comparison.name == data['stringComparison'],
          orElse: () => StringComparison.contains,
        ),
        value: data['value'],
        caseSensitive: data['caseSensitive'],
        index: int.tryParse(data['index']?.toString() ?? ''),
        negative: data['negative'],
      );

  @override
  Map<String, dynamic> toMap() => {
        if (headers != null) 'header': headers,
        if (stringComparison != null) 'stringComparison': stringComparison!.name,
        if (value != null) 'value': value,
        if (caseSensitive != null) 'caseSensitive': caseSensitive,
        if (index != null) 'index': index,
        if (negative != null) 'negative': negative,
      };
}
