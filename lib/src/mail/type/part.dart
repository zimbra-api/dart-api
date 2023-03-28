// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class Part {
  /// part
  final String part;

  const Part(this.part);

  factory Part.fromMap(Map<String, dynamic> data) => Part(
        data['part'] ?? '',
      );

  Map<String, dynamic> toMap() => {
        'part': part,
      };
}
