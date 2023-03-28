// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class AttributeName {
  /// Attribute name
  final String name;

  const AttributeName({this.name = ''});

  factory AttributeName.fromMap(Map<String, dynamic> data) => AttributeName(
        name: data['n'] ?? '',
      );

  Map<String, dynamic> toMap() => {
        'n': name,
      };
}
