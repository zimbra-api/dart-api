// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class NamedElement {
  final String? name;

  NamedElement({this.name});

  factory NamedElement.fromJson(Map<String, dynamic> json) => NamedElement(name: json['name']);

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}
