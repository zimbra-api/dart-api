// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class LinkInfo {
  /// Shared item ID
  final String? id;

  /// Item's UUID - a globally unique identifier
  final String? uuid;

  /// Item name
  final String? name;

  /// Item type
  final String? defaultView;

  /// Permissions granted
  final String? rights;

  const LinkInfo({this.id, this.uuid, this.name, this.defaultView, this.rights});

  factory LinkInfo.fromMap(Map<String, dynamic> data) =>
      LinkInfo(id: data['id'], uuid: data['uuid'], name: data['name'], defaultView: data['view'], rights: data['perm']);

  Map<String, dynamic> toMap() => {
        if (id != null) 'id': id,
        if (uuid != null) 'uuid': uuid,
        if (name != null) 'name': name,
        if (defaultView != null) 'view': defaultView,
        if (rights != null) 'perm': rights,
      };
}
