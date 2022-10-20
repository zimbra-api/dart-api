// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'filter_test.dart';

class LinkedInTest extends FilterTest {
  LinkedInTest({super.index, super.negative});

  factory LinkedInTest.fromJson(Map<String, dynamic> json) =>
      LinkedInTest(index: json['index'], negative: json['negative']);
}
