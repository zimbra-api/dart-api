// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class IdVersionName {
  /// The id
  final String? id;

  /// The email
  final int? version;

  /// The name
  final String? name;

  IdVersionName({this.id, this.version, this.name});

  factory IdVersionName.fromJson(Map<String, dynamic> json) =>
      IdVersionName(id: json['id'], version: json['ver'], name: json['name']);

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (version != null) 'ver': version,
        if (name != null) 'name': name,
      };
}