// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'filter_test.dart';

class InviteTest extends FilterTest {
  /// Methods
  final List<String> methods;

  InviteTest({this.methods = const [], super.index, super.negative});

  factory InviteTest.fromJson(Map<String, dynamic> json) => InviteTest(
      methods: (json['method'] is Iterable)
          ? List.from((json['method'] as Iterable).map<String>((method) => method['_content']))
          : [],
      index: json['index'],
      negative: json['negative']);

  @override
  Map<String, dynamic> toJson() => {
        if (methods.isNotEmpty) 'method': methods.map((method) => {'_content': method}).toList(),
        if (index != null) 'index': index,
        if (negative != null) 'negative': negative,
      };
}