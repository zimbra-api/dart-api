// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/contact_attr.dart';

import 'account_custom_metadata.dart';
import 'contact_group_member.dart';

class ContactInfo {
  final String? sortField;

  final bool? canExpand;

  final String? id;

  final String? folder;

  final String? flags;

  final String? tags;

  final String? tagNames;

  final int? changeDate;

  final int? modifiedSequenceId;

  final int? date;

  final int? revisionId;

  final String? fileAs;

  final String? email;

  final String? email2;

  final String? email3;

  final String? type;

  final String? dlist;

  final String? reference;

  final bool? tooManyMembers;

  final List<AccountCustomMetadata> metadatas;

  final List<ContactAttr> attrs;

  final List<ContactGroupMember> contactGroupMembers;

  final bool? isOwner;

  final bool? isMember;

  ContactInfo(
      {this.sortField,
      this.canExpand,
      this.id,
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
      this.isOwner,
      this.isMember});

  factory ContactInfo.fromJson(Map<String, dynamic> json) {
    final metadatas = <AccountCustomMetadata>[];
    if (json['meta'] != null && json['meta'] is Iterable) {
      final elements = json['meta'] as Iterable;
      for (final meta in elements) {
        metadatas.add(AccountCustomMetadata.fromJson(meta));
      }
    }

    final attrs = <ContactAttr>[];
    if (json['a'] != null && json['a'] is Iterable) {
      final elements = json['a'] as Iterable;
      for (final a in elements) {
        attrs.add(ContactAttr.fromJson(a));
      }
    }

    final contactGroupMembers = <ContactGroupMember>[];
    if (json['m'] != null && json['m'] is Iterable) {
      final elements = json['m'] as Iterable;
      for (final m in elements) {
        contactGroupMembers.add(ContactGroupMember.fromJson(m));
      }
    }

    return ContactInfo(
        sortField: json['sf'],
        canExpand: json['exp'],
        id: json['id'],
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
        metadatas: metadatas,
        attrs: attrs,
        contactGroupMembers: contactGroupMembers,
        isOwner: json['isOwner'],
        isMember: json['isMember']);
  }

  Map<String, dynamic> toJson() => {
        if (sortField != null) 'sf': sortField,
        if (canExpand != null) 'exp': canExpand,
        if (id != null) 'id': id,
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
        if (isOwner != null) 'isOwner': isOwner,
        if (isMember != null) 'isMember': isMember,
      };
}
