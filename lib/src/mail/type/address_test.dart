// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/address_part.dart';
import 'package:zimbra_api/src/common/enum/comparison_comparator.dart';
import 'package:zimbra_api/src/common/enum/count_comparison.dart';
import 'package:zimbra_api/src/common/enum/string_comparison.dart';
import 'package:zimbra_api/src/common/enum/value_comparison.dart';

import 'filter_test.dart';

class AddressTest extends FilterTest {
  /// Comma separated list of header names
  final String? header;

  /// Part of address to affect - all|localpart|domain
  final AddressPart? part;

  /// Comparison type - is|contains|matches
  final StringComparison? stringComparison;

  /// Case sensitive setting
  final bool? caseSensitive;

  /// Value
  final String? value;

  /// Value comparison type - gt|ge|lt|le|eq|ne
  final ValueComparison? valueComparison;

  /// count comparison type - gt|ge|lt|le|eq|ne
  final CountComparison? countComparison;

  final ComparisonComparator? valueComparisonComparator;

  AddressTest(
      {this.header,
      this.part,
      this.stringComparison,
      this.caseSensitive,
      this.value,
      this.valueComparison,
      this.countComparison,
      this.valueComparisonComparator,
      super.index,
      super.negative});

  factory AddressTest.fromJson(Map<String, dynamic> json) => AddressTest(
      header: json['header'],
      part: AddressPart.values.firstWhere(
        (part) => part.name == json['part'],
        orElse: () => AddressPart.all,
      ),
      stringComparison: StringComparison.values.firstWhere(
        (comparison) => comparison.name == json['stringComparison'],
        orElse: () => StringComparison.isA,
      ),
      caseSensitive: json['caseSensitive'],
      value: json['value'],
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
      index: json['index'],
      negative: json['negative']);

  @override
  Map<String, dynamic> toJson() => {
        if (header != null) 'header': header,
        if (part != null) 'part': part!.name,
        if (stringComparison != null) 'stringComparison': stringComparison!.name,
        if (caseSensitive != null) 'caseSensitive': caseSensitive,
        if (value != null) 'value': value,
        if (valueComparison != null) 'valueComparison': valueComparison!.name,
        if (countComparison != null) 'countComparison': countComparison!.name,
        if (valueComparisonComparator != null) 'valueComparisonComparator': valueComparisonComparator!.name,
        if (index != null) 'index': index,
        if (negative != null) 'negative': negative,
      };
}
