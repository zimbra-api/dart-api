// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/number_comparison.dart';

import 'filter_test.dart';

class SizeTest extends FilterTest {
  /// Number comparison setting - over|under
  final NumberComparison? numberComparison;

  /// Size value. Value can be specified in bytes (no suffix), kilobytes (50K), megabytes (50M) or gigabytes (2G)
  final String? size;

  SizeTest({this.numberComparison, this.size, super.index, super.negative});

  factory SizeTest.fromJson(Map<String, dynamic> json) => SizeTest(
      numberComparison: NumberComparison.values.firstWhere(
        (comparison) => comparison.name == json['numberComparison'],
        orElse: () => NumberComparison.over,
      ),
      size: json['s'],
      index: json['index'],
      negative: json['negative']);

  @override
  Map<String, dynamic> toJson() => {
        if (numberComparison != null) 'numberComparison': numberComparison!.name,
        if (size != null) 's': size,
        if (index != null) 'index': index,
        if (negative != null) 'negative': negative,
      };
}
