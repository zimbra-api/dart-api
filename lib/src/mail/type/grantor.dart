// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class Grantor {
  /// Zimbra ID
  final String? id;

  /// Email address
  final String? email;

  /// Grantor display name
  final String? name;

  Grantor({this.id, this.email, this.name});

  factory Grantor.fromMap(Map<String, dynamic> data) =>
      Grantor(id: data['id'], email: data['email'], name: data['name']);

  Map<String, dynamic> toMap() => {
        if (id != null) 'id': id,
        if (email != null) 'email': email,
        if (name != null) 'name': name,
      };
}
