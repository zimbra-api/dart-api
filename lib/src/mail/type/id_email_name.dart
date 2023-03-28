// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class IdEmailName {
  /// The id
  final String? id;

  /// The email
  final String? email;

  /// The name
  final String? name;

  const IdEmailName({this.id, this.email, this.name});

  factory IdEmailName.fromMap(Map<String, dynamic> data) => IdEmailName(
        id: data['id'],
        email: data['email'],
        name: data['name'],
      );

  Map<String, dynamic> toMap() => {
        if (id != null) 'id': id,
        if (email != null) 'email': email,
        if (name != null) 'name': name,
      };
}
