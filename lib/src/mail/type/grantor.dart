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

  factory Grantor.fromJson(Map<String, dynamic> json) =>
      Grantor(id: json['id'], email: json['email'], name: json['name']);

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (email != null) 'email': email,
        if (name != null) 'name': name,
      };
}
