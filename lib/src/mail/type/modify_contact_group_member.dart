// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/member_type.dart';
import 'package:zimbra_api/src/common/enum/modify_member_operation.dart';

import 'new_contact_group_member.dart';

/// Contact group members to modify
class ModifyContactGroupMember extends NewContactGroupMember {
  /// Operation: +|-|reset
  final ModifyMemberOperation operation;

  const ModifyContactGroupMember({
    this.operation = ModifyMemberOperation.reset,
    super.type = MemberType.contact,
    super.value,
  });

  factory ModifyContactGroupMember.fromMap(Map<String, dynamic> data) => ModifyContactGroupMember(
      operation: ModifyMemberOperation.values.firstWhere(
        (op) => op.name == data['op'],
        orElse: () => ModifyMemberOperation.reset,
      ),
      type: MemberType.values.firstWhere(
        (type) => type.name == data['type'],
        orElse: () => MemberType.contact,
      ),
      value: data['_content']);

  @override
  Map<String, dynamic> toMap() => {
        'op': operation.name,
        'type': type.name,
        if (value != null) '_content': value,
      };
}
