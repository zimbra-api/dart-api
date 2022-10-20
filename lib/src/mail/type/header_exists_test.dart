// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'filter_test.dart';

class HeaderExistsTest extends FilterTest {
  /// Header name
  final String? header;

  HeaderExistsTest({this.header, super.index, super.negative});

  factory HeaderExistsTest.fromJson(Map<String, dynamic> json) =>
      HeaderExistsTest(header: json['header'], index: json['index'], negative: json['negative']);

  @override
  Map<String, dynamic> toJson() => {
        if (header != null) 'header': header,
        if (index != null) 'index': index,
        if (negative != null) 'negative': negative,
      };
}
