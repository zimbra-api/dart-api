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

  IdEmailName({this.id, this.email, this.name});

  factory IdEmailName.fromJson(Map<String, dynamic> json) =>
      IdEmailName(id: json['id'], email: json['email'], name: json['name']);

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (email != null) 'email': email,
        if (name != null) 'name': name,
      };
}
