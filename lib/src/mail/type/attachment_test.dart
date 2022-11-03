// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'filter_test.dart';

class AttachmentTest extends FilterTest {
  AttachmentTest({super.index, super.negative});

  factory AttachmentTest.fromMap(Map<String, dynamic> data) =>
      AttachmentTest(index: data['index'], negative: data['negative']);
}
