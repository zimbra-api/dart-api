// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class NamedElement {
  final String? name;

  NamedElement({this.name});

  factory NamedElement.fromMap(Map<String, dynamic> data) => NamedElement(name: data['name']);

  Map<String, dynamic> toMap() => {
        if (name != null) 'name': name,
      };
}
