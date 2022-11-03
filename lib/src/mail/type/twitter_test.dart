// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'filter_test.dart';

class TwitterTest extends FilterTest {
  TwitterTest({super.index, super.negative});

  factory TwitterTest.fromMap(Map<String, dynamic> data) =>
      TwitterTest(index: data['index'], negative: data['negative']);
}
