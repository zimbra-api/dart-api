// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class Pref {
  final String name;

  final String? value;

  final int? modified;

  Pref(this.name, {this.value, this.modified});

  factory Pref.fromJson(Map<String, dynamic> json) =>
      Pref(json['name'], value: json['_content'], modified: json['modified']);

  Map<String, dynamic> toJson() => {
        'name': name,
        if (modified != null) 'modified': modified,
        if (value != null) '_content': value,
      };
}
