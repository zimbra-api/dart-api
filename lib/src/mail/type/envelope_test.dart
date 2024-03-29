// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/enum/address_part.dart';
import '../../common/enum/comparison_comparator.dart';
import '../../common/enum/count_comparison.dart';
import '../../common/enum/string_comparison.dart';
import '../../common/enum/value_comparison.dart';
import 'address_test.dart';

class EnvelopeTest extends AddressTest {
  const EnvelopeTest({
    super.header,
    super.part,
    super.stringComparison,
    super.caseSensitive,
    super.value,
    super.valueComparison,
    super.countComparison,
    super.valueComparisonComparator,
    super.index,
    super.negative,
  });

  factory EnvelopeTest.fromMap(Map<String, dynamic> data) => EnvelopeTest(
        header: data['header'],
        part: AddressPart.values.firstWhere(
          (part) => part.name == data['part'],
          orElse: () => AddressPart.all,
        ),
        stringComparison: StringComparison.values.firstWhere(
          (comparison) => comparison.name == data['stringComparison'],
          orElse: () => StringComparison.contains,
        ),
        caseSensitive: data['caseSensitive'],
        value: data['value'],
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
        index: int.tryParse(data['index']?.toString() ?? ''),
        negative: data['negative'],
      );
}
