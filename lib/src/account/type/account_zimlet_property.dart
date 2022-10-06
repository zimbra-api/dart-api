// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class AccountZimletProperty {
  final String? name;

  final String? value;

  AccountZimletProperty({this.name, this.value});

  factory AccountZimletProperty.fromJson(Map<String, dynamic> json) =>
      AccountZimletProperty(name: json['name'], value: json['_content']);

  Map<String, dynamic> toJson() => {
        if (name != null) 'name': name,
        if (value != null) '_content': value,
      };
}
