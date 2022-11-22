// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/contact_attr.dart';
import '../utils.dart';
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

  const ContactInfo({
    this.sortField,
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
    this.isMember,
  });

  factory ContactInfo.fromMap(Map<String, dynamic> data) => ContactInfo(
        sortField: data['sf'],
        canExpand: data['exp'],
        id: data['id'],
        folder: data['l'],
        flags: data['f'],
        tags: data['t'],
        tagNames: data['tn'],
        changeDate: int.tryParse(data['md']?.toString() ?? ''),
        modifiedSequenceId: int.tryParse(data['ms']?.toString() ?? ''),
        date: int.tryParse(data['d']?.toString() ?? ''),
        revisionId: int.tryParse(data['rev']?.toString() ?? ''),
        fileAs: data['fileAsStr'],
        email: data['email'],
        email2: data['email2'],
        email3: data['email3'],
        type: data['type'],
        dlist: data['dlist'],
        reference: data['ref'],
        tooManyMembers: data['tooManyMembers'],
        metadatas: (data['meta'] is Iterable)
            ? (data['meta'] as Iterable)
                .map<AccountCustomMetadata>((meta) => AccountCustomMetadata.fromMap(meta))
                .toList(growable: false)
            : const [],
        attrs: (data['_attrs'] is Map) ? Utils.contactAttrsFromMap(data['_attrs'] as Map<String, dynamic>) : const [],
        contactGroupMembers: (data['m'] is Iterable)
            ? (data['m'] as Iterable)
                .map<ContactGroupMember>((m) => ContactGroupMember.fromMap(m))
                .toList(growable: false)
            : const [],
        isOwner: data['isOwner'],
        isMember: data['isMember'],
      );

  Map<String, dynamic> toMap() => {
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
        if (metadatas.isNotEmpty) 'meta': metadatas.map((meta) => meta.toMap()).toList(growable: false),
        if (attrs.isNotEmpty) 'a': attrs.map((a) => a.toMap()).toList(growable: false),
        if (contactGroupMembers.isNotEmpty) 'm': contactGroupMembers.map((m) => m.toMap()).toList(growable: false),
        if (isOwner != null) 'isOwner': isOwner,
        if (isMember != null) 'isMember': isMember,
      };
}
