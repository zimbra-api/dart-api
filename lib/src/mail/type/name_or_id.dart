// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class NameOrId {
  /// The name
  final String? name;

  /// The id
  final String? id;

  NameOrId({this.name, this.id});

  factory NameOrId.fromJson(Map<String, dynamic> json) => NameOrId(name: json['name'], id: json['id']);

  Map<String, dynamic> toJson() => {
        if (name != null) 'name': name,
        if (id != null) 'id': id,
      };
}
