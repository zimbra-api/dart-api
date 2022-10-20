// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/comparison_comparator.dart';
import 'package:zimbra_api/src/common/enum/count_comparison.dart';
import 'package:zimbra_api/src/common/enum/string_comparison.dart';
import 'package:zimbra_api/src/common/enum/value_comparison.dart';

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

  HeaderTest(
      {this.headers,
      this.stringComparison,
      this.valueComparison,
      this.countComparison,
      this.valueComparisonComparator,
      this.value,
      this.caseSensitive,
      super.index,
      super.negative});

  factory HeaderTest.fromJson(Map<String, dynamic> json) => HeaderTest(
      headers: json['header'],
      stringComparison: StringComparison.values.firstWhere(
        (comparison) => comparison.name == json['stringComparison'],
        orElse: () => StringComparison.isA,
      ),
      valueComparison: ValueComparison.values.firstWhere(
        (comparison) => comparison.name == json['valueComparison'],
        orElse: () => ValueComparison.equal,
      ),
      countComparison: CountComparison.values.firstWhere(
        (comparison) => comparison.name == json['countComparison'],
        orElse: () => CountComparison.equal,
      ),
      valueComparisonComparator: ComparisonComparator.values.firstWhere(
        (comparator) => comparator.name == json['valueComparisonComparator'],
        orElse: () => ComparisonComparator.asciiNumeric,
      ),
      value: json['value'],
      caseSensitive: json['caseSensitive'],
      index: json['index'],
      negative: json['negative']);

  @override
  Map<String, dynamic> toJson() => {
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
