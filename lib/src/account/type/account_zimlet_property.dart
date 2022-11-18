// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class AccountZimletProperty {
  final String? name;

  final String? value;

  const AccountZimletProperty({this.name, this.value});

  factory AccountZimletProperty.fromMap(Map<String, dynamic> data) =>
      AccountZimletProperty(name: data['name'], value: data['_content']);

  Map<String, dynamic> toMap() => {
        if (name != null) 'name': name,
        if (value != null) '_content': value,
      };
}
