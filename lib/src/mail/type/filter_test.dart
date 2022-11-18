// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class FilterTest {
  /// Index - specifies a guaranteed order for the test elements
  final int? index;

  /// Specifies a "not" condition for the test
  final bool? negative;

  const FilterTest({this.index, this.negative});

  factory FilterTest.fromMap(Map<String, dynamic> data) =>
      FilterTest(index: int.tryParse(data['index']?.toString() ?? ''), negative: data['negative']);

  Map<String, dynamic> toMap() => {
        if (index != null) 'index': index,
        if (negative != null) 'negative': negative,
      };
}
