// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/contact_attr.dart';

import 'contact_group_member.dart';
import 'mail_custom_metadata.dart';

/// Contact information
class ContactInfo {
  /// Sort field value
  final String? sortField;

  /// Set if the user can (has right to) expand group members.
  /// Returned only if needExp is set in the request and only on group entries (type=group in attrs on a <cn>).
  final bool? canExpand;

  /// Unique contact ID
  final String? id;

  /// IMAP UID
  final int? imapUid;

  /// Folder ID. When creating a contact, this is the ID of the folder to create the contact in
  final String? folder;

  /// Flags. {flags} = (f)lagged, has (a)ttachment
  final String? flags;

  /// Tags - Comma separated list of ints.  DEPRECATED - use "tn" instead
  final String? tags;

  /// Comma-separated list of tag names
  final String? tagNames;

  /// Modified date in seconds
  final int? changeDate;

  /// Modified sequence
  final int? modifiedSequenceId;

  /// Date in milliseconds
  final int? date;

  /// Saved sequence number
  final int? revisionId;

  /// Current "file as" string for display/sorting purposes; cannot be used to set the file-as value
  final String? fileAs;

  /// Contact email address
  final String? email;

  /// Contact email address 2
  final String? email2;

  /// Contact email address 3
  final String? email3;

  /// Contact type
  final String? type;

  /// Contact dlist
  final String? dlist;

  /// GAL entry reference
  final String? reference;

  /// If number of members on a GAL group is greater than the specified max,
  /// do not return any members for the entry.  Instead, set "tooManyMembers.
  final bool? tooManyMembers;

  /// Custom metadata information
  final List<MailCustomMetadata> metadatas;

  /// Attributes
  final List<ContactAttr> attrs;

  /// Contact group members
  final List<ContactGroupMember> contactGroupMembers;

  /// Comma separated list of IDs of contact groups this contact is a member of. Only provided if requested
  final String? memberOf;

  ContactInfo(
      {this.sortField,
      this.canExpand,
      this.id,
      this.imapUid,
      this.folder,
      this.flags,
      this.tags,
      this.tagNames,
      this.changeDate,
      this.modifiedSequenceId,
      this.date,
      this.revisionId,
      this.fileAs,
      this.email,
      this.email2,
      this.email3,
      this.type,
      this.dlist,
      this.reference,
      this.tooManyMembers,
      this.metadatas = const [],
      this.attrs = const [],
      this.contactGroupMembers = const [],
      this.memberOf});

  factory ContactInfo.fromJson(Map<String, dynamic> json) => ContactInfo(
      sortField: json['sf'],
      canExpand: json['exp'],
      id: json['id'],
      imapUid: json['i4uid'],
      folder: json['l'],
      flags: json['f'],
      tags: json['t'],
      tagNames: json['tn'],
      changeDate: json['md'],
      modifiedSequenceId: json['ms'],
      date: json['d'],
      revisionId: json['rev'],
      fileAs: json['fileAsStr'],
      email: json['email'],
      email2: json['email2'],
      email3: json['email3'],
      type: json['type'],
      dlist: json['dlist'],
      reference: json['ref'],
      tooManyMembers: json['tooManyMembers'],
      metadatas: (json['meta'] is Iterable)
          ? List.from((json['meta'] as Iterable).map<MailCustomMetadata>((meta) => MailCustomMetadata.fromJson(meta)))
          : [],
      attrs: (json['_attrs'] is Map) ? List.from(_attrsFromJson(json['_attrs'] as Map<String, dynamic>)) : [],
      contactGroupMembers: (json['m'] is Iterable)
          ? List.from((json['m'] as Iterable).map<ContactGroupMember>((m) => ContactGroupMember.fromJson(m)))
          : [],
      memberOf: json['memberOf']?['_content']);

  Map<String, dynamic> toJson() => {
        if (sortField != null) 'sf': sortField,
        if (canExpand != null) 'exp': canExpand,
        if (id != null) 'id': id,
        if (imapUid != null) 'i4uid': imapUid,
        if (folder != null) 'l': folder,
        if (flags != null) 'f': flags,
        if (tags != null) 't': tags,
        if (tagNames != null) 'tn': tagNames,
        if (changeDate != null) 'md': changeDate,
        if (modifiedSequenceId != null) 'ms': modifiedSequenceId,
        if (date != null) 'd': date,
        if (revisionId != null) 'rev': revisionId,
        if (fileAs != null) 'fileAsStr': fileAs,
        if (email != null) 'email': email,
        if (email2 != null) 'email2': email2,
        if (email3 != null) 'email3': email3,
        if (type != null) 'type': type,
        if (dlist != null) 'dlist': dlist,
        if (reference != null) 'ref': reference,
        if (tooManyMembers != null) 'tooManyMembers': tooManyMembers,
        if (metadatas.isNotEmpty) 'meta': metadatas.map((meta) => meta.toJson()).toList(),
        if (attrs.isNotEmpty) 'a': attrs.map((a) => a.toJson()).toList(),
        if (contactGroupMembers.isNotEmpty) 'm': contactGroupMembers.map((m) => m.toJson()).toList(),
        if (memberOf != null) 'memberOf': {'_content': memberOf},
      };

  static List<ContactAttr> _attrsFromJson(Map<String, dynamic> json) {
    final attrs = <ContactAttr>[];
    for (final entry in json.entries) {
      if (entry.value is Iterable) {
        attrs.addAll((entry.value as Iterable).map<ContactAttr>((value) => ContactAttr(entry.key, value: value)));
      } else {
        attrs.add(ContactAttr(entry.key, value: entry.value));
      }
    }
    return attrs;
  }
}
