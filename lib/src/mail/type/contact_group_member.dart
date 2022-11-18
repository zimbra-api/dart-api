// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/member_type.dart';

import 'contact_info.dart';

class ContactGroupMember {
  /// Member type
  /// C: reference to another contact
  /// G: reference to a GAL entry
  /// I: inlined member (member name and email address is embeded in the contact group)
  final MemberType type;

  /// Member value
  /// type="C"     Item ID of another contact.
  /// If the referenced contact is in a shared folder, the item ID must be qualified by zimbraId of the owner. e.g. {zimbraId}:{itemId}
  /// type="G"     GAL entry reference (returned in SearchGalResponse)
  /// type="I"     name and email address in the form of: "{name}" <{email}>
  final String? value;

  /// Contact information for dereferenced member.
  final ContactInfo? contact;

  const ContactGroupMember({this.type = MemberType.contact, this.value, this.contact});

  factory ContactGroupMember.fromMap(Map<String, dynamic> data) => ContactGroupMember(
      type: MemberType.values.firstWhere(
        (type) => type.name == data['type'],
        orElse: () => MemberType.contact,
      ),
      value: data['_content'],
      contact: data['cn'] is Map ? ContactInfo.fromMap(data['cn']) : null);

  Map<String, dynamic> toMap() => {
        'type': type.name,
        if (value != null) '_content': value,
        if (contact != null) 'cn': contact!.toMap(),
      };
}
