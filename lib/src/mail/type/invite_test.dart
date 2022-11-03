// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'filter_test.dart';

class InviteTest extends FilterTest {
  /// Methods
  final List<String> methods;

  InviteTest({this.methods = const [], super.index, super.negative});

  factory InviteTest.fromMap(Map<String, dynamic> data) => InviteTest(
      methods: (data['method'] is Iterable)
          ? List.from((data['method'] as Iterable).map<String>((method) => method['_content']))
          : [],
      index: data['index'],
      negative: data['negative']);

  @override
  Map<String, dynamic> toMap() => {
        if (methods.isNotEmpty) 'method': methods.map((method) => {'_content': method}).toList(),
        if (index != null) 'index': index,
        if (negative != null) 'negative': negative,
      };
}
