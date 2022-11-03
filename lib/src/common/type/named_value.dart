// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class NamedValue {
  final String name;

  final String? value;

  NamedValue(this.name, {this.value});

  factory NamedValue.fromMap(Map<String, dynamic> data) => NamedValue(data['name'], value: data['_content']);

  Map<String, dynamic> toMap() => {
        'name': name,
        if (value != null) '_content': value,
      };
}
