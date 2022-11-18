// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class NameOrId {
  /// The name
  final String? name;

  /// The id
  final String? id;

  const NameOrId({this.name, this.id});

  factory NameOrId.fromMap(Map<String, dynamic> data) => NameOrId(name: data['name'], id: data['id']);

  Map<String, dynamic> toMap() => {
        if (name != null) 'name': name,
        if (id != null) 'id': id,
      };
}
