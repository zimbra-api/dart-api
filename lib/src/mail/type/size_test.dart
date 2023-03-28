// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/enum/number_comparison.dart';
import 'filter_test.dart';

class SizeTest extends FilterTest {
  /// Number comparison setting - over|under
  final NumberComparison? numberComparison;

  /// Size value. Value can be specified in bytes (no suffix), kilobytes (50K), megabytes (50M) or gigabytes (2G)
  final String? size;

  const SizeTest(
      {this.numberComparison, this.size, super.index, super.negative});

  factory SizeTest.fromMap(Map<String, dynamic> data) => SizeTest(
        numberComparison: NumberComparison.values.firstWhere(
          (comparison) => comparison.name == data['numberComparison'],
          orElse: () => NumberComparison.over,
        ),
        size: data['s'],
        index: int.tryParse(data['index']?.toString() ?? ''),
        negative: data['negative'],
      );

  @override
  Map<String, dynamic> toMap() => {
        if (numberComparison != null)
          'numberComparison': numberComparison!.name,
        if (size != null) 's': size,
        if (index != null) 'index': index,
        if (negative != null) 'negative': negative,
      };
}
