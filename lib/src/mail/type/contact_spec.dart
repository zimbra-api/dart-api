// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'new_contact_attr.dart';
import 'new_contact_group_member.dart';
import 'vcard_info.dart';

class ContactSpec {
  /// ID - specified when modifying a contact
  final int? id;

  /// ID of folder to create contact in. Un-specified means use the default Contacts folder.
  final String? folder;

  /// Tags - Comma separated list of ints.  DEPRECATED - use "tn" instead
  final String? tags;

  /// Comma-separated list of tag names
  final String? tagNames;

  /// Either a vcard or attributes can be specified but not both.
  final VCardInfo? vcard;

  /// Contact attributes.  Cannot specify <vcard> as well as these
  final List<NewContactAttr> attrs;

  /// Valid only if the contact being created is a contact group
  /// (has attribute type="group")
  final List<NewContactGroupMember> contactGroupMembers;

  ContactSpec(
      {this.id,
      this.folder,
      this.tags,
      this.tagNames,
      this.vcard,
      this.attrs = const [],
      this.contactGroupMembers = const []});

  factory ContactSpec.fromMap(Map<String, dynamic> data) => ContactSpec(
      id: int.tryParse(data['id']?.toString() ?? ''),
      folder: data['l'],
      tags: data['t'],
      tagNames: data['tn'],
      vcard: data['vcard'] is Map ? VCardInfo.fromMap(data['vcard']) : null,
      attrs: (data['a'] is Iterable)
          ? List.from((data['a'] as Iterable).map<NewContactAttr>((a) => NewContactAttr.fromMap(a)))
          : [],
      contactGroupMembers: (data['m'] is Iterable)
          ? List.from((data['m'] as Iterable).map<NewContactGroupMember>((m) => NewContactGroupMember.fromMap(m)))
          : []);

  Map<String, dynamic> toMap() => {
        if (id != null) 'id': id,
        if (folder != null) 'l': folder,
        if (tags != null) 't': tags,
        if (tagNames != null) 'tn': tagNames,
        if (vcard != null) 'vcard': vcard!.toMap(),
        if (attrs.isNotEmpty) 'a': attrs.map((a) => a.toMap()).toList(),
        if (contactGroupMembers.isNotEmpty) 'm': contactGroupMembers.map((m) => m.toMap()).toList(),
      };
}
