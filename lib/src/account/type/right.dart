// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class Right {
  final String right;

  Right(this.right);

  factory Right.fromJson(Map<String, dynamic> json) => Right(json['right'] ?? '');

  Map<String, dynamic> toJson() => {
        'right': right,
      };
}
