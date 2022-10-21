// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/string_comparison.dart';

import 'filter_test.dart';

class MimeHeaderTest extends FilterTest {
  /// Comma separated list of header names
  final String? headers;

  /// String comparison type - is|contains|matches
  final StringComparison? stringComparison;

  /// Value
  final String? value;

  /// Case sensitive setting
  final bool? caseSensitive;

  MimeHeaderTest({this.headers, this.stringComparison, this.value, this.caseSensitive, super.index, super.negative});

  factory MimeHeaderTest.fromJson(Map<String, dynamic> json) => MimeHeaderTest(
      headers: json['header'],
      stringComparison: StringComparison.values.firstWhere(
        (comparison) => comparison.name == json['stringComparison'],
        orElse: () => StringComparison.contains,
      ),
      value: json['value'],
      caseSensitive: json['caseSensitive'],
      index: json['index'],
      negative: json['negative']);

  @override
  Map<String, dynamic> toJson() => {
        if (headers != null) 'header': headers,
        if (stringComparison != null) 'stringComparison': stringComparison!.name,
        if (value != null) 'value': value,
        if (caseSensitive != null) 'caseSensitive': caseSensitive,
        if (index != null) 'index': index,
        if (negative != null) 'negative': negative,
      };
}
