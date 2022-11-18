// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class Prop {
  final String zimlet;

  final String name;

  final String? value;

  const Prop(this.zimlet, this.name, {this.value});

  factory Prop.fromMap(Map<String, dynamic> data) => Prop(data['zimlet'], data['name'], value: data['_content']);

  Map<String, dynamic> toMap() => {
        'zimlet': zimlet,
        'name': name,
        if (value != null) '_content': value,
      };
}
