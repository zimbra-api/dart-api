// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class AttributeName {
  /// Attribute name
  final String name;

  AttributeName({this.name = ''});

  factory AttributeName.fromJson(Map<String, dynamic> json) => AttributeName(name: json['n'] ?? '');

  Map<String, dynamic> toJson() => {
        'n': name,
      };
}
