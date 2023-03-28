// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class OpValue {
  final String op;

  final String? value;

  const OpValue({this.op = '+', this.value});

  factory OpValue.fromMap(Map<String, dynamic> data) => OpValue(
        op: data['op'] ?? '+',
        value: data['_content'],
      );

  Map<String, dynamic> toMap() => {
        'op': <String>['+', '-'].contains(op) ? op : '+',
        if (value != null) '_content': value,
      };
}
