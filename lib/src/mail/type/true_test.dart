// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'filter_test.dart';

class TrueTest extends FilterTest {
  const TrueTest({super.index, super.negative});

  factory TrueTest.fromMap(Map<String, dynamic> data) => TrueTest(
        index: int.tryParse(data['index']?.toString() ?? ''),
        negative: data['negative'],
      );
}
