// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'modify_contact_attr.dart';
import 'modify_contact_group_member.dart';

class ModifyContactSpec {
  /// ID - specified when modifying a contact
  final int? id;

  /// Comma-separated list of tag names
  final String? tagNames;

  /// Contact attributes.  Cannot specify <vcard> as well as these
  final List<ModifyContactAttr> attributes;

  /// Valid only if the contact being created is a contact group
  /// (has attribute type="group")
  final List<ModifyContactGroupMember> contactGroupMembers;

  ModifyContactSpec({this.id, this.tagNames, this.attributes = const [], this.contactGroupMembers = const []});

  factory ModifyContactSpec.fromJson(Map<String, dynamic> json) => ModifyContactSpec(
      id: json['id'],
      tagNames: json['tn'],
      attributes: (json['a'] is Iterable)
          ? List.from((json['a'] as Iterable).map<ModifyContactAttr>((a) => ModifyContactAttr.fromJson(a)))
          : [],
      contactGroupMembers: (json['m'] is Iterable)
          ? List.from(
              (json['m'] as Iterable).map<ModifyContactGroupMember>((m) => ModifyContactGroupMember.fromJson(m)))
          : []);

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (tagNames != null) 'tn': tagNames,
        if (attributes.isNotEmpty) 'a': attributes.map((a) => a.toJson()).toList(),
        if (contactGroupMembers.isNotEmpty) 'm': contactGroupMembers.map((m) => m.toJson()).toList(),
      };
}
