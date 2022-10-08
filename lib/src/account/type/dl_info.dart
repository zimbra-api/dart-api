// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/key_value_pair.dart';

import 'object_info.dart';

class DLInfo extends ObjectInfo {
  /// ldap dn of the DL.
  final String ref;

  /// Display name of group
  final String? displayName;

  /// Flags whether the group is dynamic or not
  final bool? isDynamic;

  /// Present if the account is a member of the returned list because they are either a
  /// direct or indirect member of another list that is a member of the returned list.
  final String? via;

  /// Flags whether user is the owner of the group.
  /// Only returned if ownerOf on the request is true
  final bool? isOwner;

  /// Flags whether user is a member of the group.
  /// Only returned if memberOf on the request is true
  final bool? isMember;

  DLInfo(super.name, super.id, this.ref,
      {super.attrList, this.displayName, this.isDynamic, this.via, this.isOwner, this.isMember});

  factory DLInfo.fromJson(Map<String, dynamic> json) {
    final attrList = <KeyValuePair>[];
    if (json['a'] != null && json['a'] is Iterable) {
      final attrs = json['a'] as Iterable;
      for (final attr in attrs) {
        attrList.add(KeyValuePair.fromJson(attr));
      }
    }

    final info = DLInfo(json['name'], json['id'], json['ref'],
        displayName: json['d'],
        isDynamic: json['dynamic'],
        via: json['via'],
        isOwner: json['isOwner'],
        isMember: json['isMember'],
        attrList: attrList);

    return info;
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'ref': ref,
        if (displayName != null) 'd': displayName,
        if (isDynamic != null) 'dynamic': isDynamic,
        if (via != null) 'via': via,
        if (isOwner != null) 'isOwner': isOwner,
        if (isMember != null) 'isMember': isMember,
        if (attrList.isNotEmpty) 'a': attrList.map((a) => a.toJson()).toList(),
      };
}
