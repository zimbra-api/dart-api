// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'distribution_list_grantee_info.dart';
import 'distribution_list_right_info.dart';
import 'object_info.dart';

class DistributionListInfo extends ObjectInfo {
  /// Flags whether user is the owner of the group.
  /// Only returned if ownerOf on the request is 1 true
  final bool? isOwner;

  /// Flags whether user is a member of the group.
  /// Only returned if memberOf on the request is true
  final bool? isMember;

  /// Flags whether the group is dynamic or not
  final bool? isDynamic;

  /// Group members
  final List<String> members;

  /// Group owners
  final List<DistributionListGranteeInfo> owners;

  /// Rights
  final List<DistributionListRightInfo> rights;

  DistributionListInfo(super.name, super.id,
      {this.isOwner,
      this.isMember,
      this.isDynamic,
      this.members = const [],
      this.owners = const [],
      this.rights = const []});

  factory DistributionListInfo.fromJson(Map<String, dynamic> json) {
    final members = <String>[];
    if (json['dlm'] != null && json['dlm'] is Iterable) {
      final dlms = json['dlm'] as Iterable;
      for (final dlm in dlms) {
        members.add(dlm['_content']);
      }
    }

    final owners = <DistributionListGranteeInfo>[];
    if (json['owners'] != null && json['owners'] is Map<String, dynamic>) {
      final elements = json['owners']['owner'] as Iterable;
      for (final owner in elements) {
        owners.add(DistributionListGranteeInfo.fromJson(owner));
      }
    }

    final rights = <DistributionListRightInfo>[];
    if (json['rights'] != null && json['rights'] is Map<String, dynamic>) {
      final elements = json['rights']['right'] as Iterable;
      for (final right in elements) {
        rights.add(DistributionListRightInfo.fromJson(right));
      }
    }

    return DistributionListInfo(
      json['name'] ?? '',
      json['id'] ?? '',
      isOwner: json['isOwner'],
      isMember: json['isMember'],
      isDynamic: json['dynamic'],
      members: members,
      owners: owners,
      rights: rights,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        if (isOwner != null) 'isOwner': isOwner,
        if (isMember != null) 'isMember': isMember,
        if (isDynamic != null) 'dynamic': isDynamic,
        if (members.isNotEmpty) 'dlm': members.map((dlm) => {'_content': dlm}).toList(),
        if (owners.isNotEmpty) 'owners': {'owner': owners.map((owner) => owner.toJson()).toList()},
        if (rights.isNotEmpty) 'rights': {'right': rights.map((right) => right.toJson()).toList()},
      };
}
