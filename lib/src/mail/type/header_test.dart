// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/enum/comparison_comparator.dart';
import '../../common/enum/count_comparison.dart';
import '../../common/enum/string_comparison.dart';
import '../../common/enum/value_comparison.dart';
import 'filter_test.dart';

class HeaderTest extends FilterTest {
  /// Comma separated list of header names
  final String? headers;

  /// String comparison type - is|contains|matches
  final StringComparison? stringComparison;

  /// Value comparison type - gt|ge|lt|le|eq|ne
  final ValueComparison? valueComparison;

  /// count comparison type - gt|ge|lt|le|eq|ne
  final CountComparison? countComparison;

  /// comparison comparator - i;ascii-numeric|i;ascii-casemap|i;octet
  final ComparisonComparator? valueComparisonComparator;

  ///Value
  final String? value;

  /// Case sensitive setting
  final bool? caseSensitive;

  const HeaderTest({
    this.headers,
    this.stringComparison,
    this.valueComparison,
    this.countComparison,
    this.valueComparisonComparator,
    this.value,
    this.caseSensitive,
    super.index,
    super.negative,
  });

  factory HeaderTest.fromMap(Map<String, dynamic> data) => HeaderTest(
      headers: data['header'],
      stringComparison: StringComparison.values.firstWhere(
        (comparison) => comparison.name == data['stringComparison'],
        orElse: () => StringComparison.contains,
      ),
      valueComparison: ValueComparison.values.firstWhere(
        (comparison) => comparison.name == data['valueComparison'],
        orElse: () => ValueComparison.equal,
      ),
      countComparison: CountComparison.values.firstWhere(
        (comparison) => comparison.name == data['countComparison'],
        orElse: () => CountComparison.equal,
      ),
      valueComparisonComparator: ComparisonComparator.values.firstWhere(
        (comparator) => comparator.name == data['valueComparisonComparator'],
        orElse: () => ComparisonComparator.asciiNumeric,
      ),
      value: data['value'],
      caseSensitive: data['caseSensitive'],
      index: int.tryParse(data['index']?.toString() ?? ''),
      negative: data['negative']);

  @override
  Map<String, dynamic> toMap() => {
        if (headers != null) 'header': headers,
        if (stringComparison != null) 'stringComparison': stringComparison!.name,
        if (valueComparison != null) 'valueComparison': valueComparison!.name,
        if (countComparison != null) 'countComparison': countComparison!.name,
        if (valueComparisonComparator != null) 'valueComparisonComparator': valueComparisonComparator!.name,
        if (value != null) 'value': value,
        if (caseSensitive != null) 'caseSensitive': caseSensitive,
        if (index != null) 'index': index,
        if (negative != null) 'negative': negative,
      };
}
