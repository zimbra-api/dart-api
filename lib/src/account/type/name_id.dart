// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class NameId {
  final String? name;

  final String? id;

  const NameId({this.name, this.id});

  factory NameId.fromMap(Map<String, dynamic> data) => NameId(
        name: data['name'],
        id: data['id'],
      );

  Map<String, dynamic> toMap() => {
        if (name != null) 'name': name,
        if (id != null) 'id': id,
      };
}
