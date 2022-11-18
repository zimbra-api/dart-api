// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'filter_test.dart';

class SocialcastTest extends FilterTest {
  const SocialcastTest({super.index, super.negative});

  factory SocialcastTest.fromMap(Map<String, dynamic> data) =>
      SocialcastTest(index: int.tryParse(data['index']?.toString() ?? ''), negative: data['negative']);
}
