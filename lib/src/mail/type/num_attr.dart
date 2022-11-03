// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// Number attribute
class NumAttr {
  /// Number
  final int num;

  NumAttr(this.num);

  factory NumAttr.fromMap(Map<String, dynamic> data) => NumAttr(data['num'] ?? 0);

  Map<String, dynamic> toMap() => {
        'num': num,
      };
}
