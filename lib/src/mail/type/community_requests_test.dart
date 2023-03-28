// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'filter_test.dart';

class CommunityRequestsTest extends FilterTest {
  const CommunityRequestsTest({super.index, super.negative});

  factory CommunityRequestsTest.fromMap(
    Map<String, dynamic> data,
  ) =>
      CommunityRequestsTest(
        index: int.tryParse(data['index']?.toString() ?? ''),
        negative: data['negative'],
      );
}
