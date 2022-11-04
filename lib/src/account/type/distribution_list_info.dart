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
      this.rights = const [],
      super.attrList = const []});

  factory DistributionListInfo.fromMap(Map<String, dynamic> data) => DistributionListInfo(
      data['name'] ?? '', data['id'] ?? '',
      isOwner: data['isOwner'],
      isMember: data['isMember'],
      isDynamic: data['dynamic'],
      members:
          (data['dlm'] is Iterable) ? List.from((data['dlm'] as Iterable).map<String>((dlm) => dlm['_content'])) : [],
      owners: (data['owners']?['owner'] is Iterable)
          ? List.from((data['owners']['owner'] as Iterable)
              .map<DistributionListGranteeInfo>((owner) => DistributionListGranteeInfo.fromMap(owner)))
          : [],
      rights: (data['rights']?['right'] is Iterable)
          ? List.from((data['rights']['right'] as Iterable)
              .map<DistributionListRightInfo>((right) => DistributionListRightInfo.fromMap(right)))
          : [],
      attrList: ObjectInfo.attrListFromJson(data));

  Map<String, dynamic> toMap() => {
        'name': name,
        'id': id,
        if (isOwner != null) 'isOwner': isOwner,
        if (isMember != null) 'isMember': isMember,
        if (isDynamic != null) 'dynamic': isDynamic,
        if (members.isNotEmpty) 'dlm': members.map((dlm) => {'_content': dlm}).toList(),
        if (owners.isNotEmpty) 'owners': {'owner': owners.map((owner) => owner.toMap()).toList()},
        if (rights.isNotEmpty) 'rights': {'right': rights.map((right) => right.toMap()).toList()},
        if (attrList.isNotEmpty) 'a': attrList.map((attr) => attr.toMap()).toList(),
      };
}
