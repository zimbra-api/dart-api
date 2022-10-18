// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// Free busy user request information
class FreeBusyUserSpec {
  /// Calendar folder ID; if omitted, get f/b on all calendar folders
  final int? folderId;

  /// Zimbra ID. Either "name" or "id" must be specified
  final String? id;

  /// Email address.  Either "name" or "id" must be specified
  final String? name;

  FreeBusyUserSpec({this.folderId, this.id, this.name});

  factory FreeBusyUserSpec.fromJson(Map<String, dynamic> json) =>
      FreeBusyUserSpec(folderId: json['l'], id: json['id'], name: json['name']);

  Map<String, dynamic> toJson() => {
        if (folderId != null) 'l': folderId,
        if (id != null) 'id': id,
        if (name != null) 'name': name,
      };
}