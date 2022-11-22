// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/enum/member_type.dart';

class NewContactGroupMember {
  /// Member type
  /// C: reference to another contact
  /// G: reference to a GAL entry
  /// I: inlined member (member name and email address is embeded in the contact group)
  final MemberType type;

  final String? value;

  const NewContactGroupMember({this.type = MemberType.contact, this.value});

  factory NewContactGroupMember.fromMap(Map<String, dynamic> data) => NewContactGroupMember(
      type: MemberType.values.firstWhere((type) => type.name == data['type'], orElse: () => MemberType.contact),
      value: data['_content']);

  Map<String, dynamic> toMap() => {
        'type': type.name,
        if (value != null) '_content': value,
      };
}
