// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class OpValue {
  final String op;

  final String? value;

  OpValue({this.op = '+', this.value});

  factory OpValue.fromJson(Map<String, dynamic> json) => OpValue(op: json['op'] ?? '+', value: json['_content']);

  Map<String, dynamic> toJson() => {
        'op': <String>['+', '-'].contains(op) ? op : '+',
        if (value != null) '_content': value,
      };
}
