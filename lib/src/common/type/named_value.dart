// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class NamedValue {
  final String name;

  final String? value;

  NamedValue(this.name, {this.value});

  factory NamedValue.fromJson(Map<String, dynamic> json) => NamedValue(json['name'], value: json['_content']);

  Map<String, dynamic> toJson() => {
        'name': name,
        if (value != null) '_content': value,
      };
}
