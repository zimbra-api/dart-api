// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/address_part.dart';
import 'package:zimbra_api/src/common/enum/comparison_comparator.dart';
import 'package:zimbra_api/src/common/enum/count_comparison.dart';
import 'package:zimbra_api/src/common/enum/string_comparison.dart';
import 'package:zimbra_api/src/common/enum/value_comparison.dart';

import 'address_test.dart';

class EnvelopeTest extends AddressTest {
  EnvelopeTest(
      {super.header,
      super.part,
      super.stringComparison,
      super.caseSensitive,
      super.value,
      super.valueComparison,
      super.countComparison,
      super.valueComparisonComparator,
      super.index,
      super.negative});

  factory EnvelopeTest.fromJson(Map<String, dynamic> json) => EnvelopeTest(
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
}
