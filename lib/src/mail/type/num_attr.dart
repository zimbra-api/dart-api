// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// Number attribute
class NumAttr {
  /// Number
  final int num;

  NumAttr(this.num);

  factory NumAttr.fromJson(Map<String, dynamic> json) => NumAttr(json['num'] ?? 0);

  Map<String, dynamic> toJson() => {
        'num': num,
      };
}
