// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class GranteeChooser {
  final String? type;

  final String? id;

  final String? name;

  GranteeChooser({this.type, this.id, this.name});

  factory GranteeChooser.fromJson(Map<String, dynamic> json) =>
      GranteeChooser(type: json['type'], id: json['id'], name: json['name']);

  Map<String, dynamic> toJson() => {
        if (type != null) 'type': type,
        if (id != null) 'id': id,
        if (name != null) 'name': name,
      };
}
