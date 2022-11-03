// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class IdVersion {
  /// The id
  final String? id;

  /// The email
  final int? version;

  IdVersion({
    this.id,
    this.version,
  });

  factory IdVersion.fromMap(Map<String, dynamic> data) => IdVersion(id: data['id'], version: data['ver']);

  Map<String, dynamic> toMap() => {
        if (id != null) 'id': id,
        if (version != null) 'ver': version,
      };
}
