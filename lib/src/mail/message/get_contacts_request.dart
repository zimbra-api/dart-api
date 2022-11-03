// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/attribute_name.dart';
import 'package:zimbra_api/src/common/type/id.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'get_contacts_body.dart';
import 'get_contacts_envelope.dart';

/// Get contacts
/// Contact group members are returned as <m> elements.
/// If derefGroupMember is not set, group members are returned in the order they were inserted in the group.
/// If derefGroupMember is set, group members are returned ordered by the "key" of member.
/// Key is:
/// - for contact ref (type="C"): the fileAs field of the Contact
/// - for GAL ref (type="G"): email address of the GAL entry
/// - for inlined member (type="I"): the value
///
/// Contact group members are returned as sub-elements of <m>.
/// If for any(transient or permanent) reason a member cannot be dereferenced, then there will be no sub-element under <m>.
class GetContactsRequest extends SoapRequest {
  /// If set, return modified date (md) on contacts.
  final bool? sync;

  /// If is present, return only contacts in the specified folder.
  final String? folderId;

  /// Sort by
  final String? sortBy;

  /// If set, deref contact group members.
  final bool? derefGroupMember;

  /// If set, Include the list of contact groups this contact is a member of.
  final bool? includeMemberOf;

  /// Whether to return contact hidden attrs defined in zimbraContactHiddenAttributes
  final bool? returnHiddenAttrs;

  /// Whether to return smime certificate info
  final bool? returnCertInfo;

  /// Set to return IMAP UID. (default is unset.)
  final bool? wantImapUid;

  /// Max members
  final int? maxMembers;

  /// Attrs - if present, return only the specified attribute(s).
  final List<AttributeName> attributes;

  /// If present, return only the specified attribute(s) for derefed members, applicable
  /// only when derefGroupMember is set.
  final List<AttributeName> memberAttributes;

  /// If present, only get the specified contact(s).
  final List<Id> contacts;

  GetContactsRequest(
      {this.sync,
      this.folderId,
      this.sortBy,
      this.derefGroupMember,
      this.includeMemberOf,
      this.returnHiddenAttrs,
      this.returnCertInfo,
      this.wantImapUid,
      this.maxMembers,
      this.attributes = const [],
      this.memberAttributes = const [],
      this.contacts = const []});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => GetContactsEnvelope(GetContactsBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        if (sync != null) 'sync': sync,
        if (folderId != null) 'l': folderId,
        if (sortBy != null) 'sortBy': sortBy,
        if (derefGroupMember != null) 'derefGroupMember': derefGroupMember,
        if (includeMemberOf != null) 'memberOf': includeMemberOf,
        if (returnHiddenAttrs != null) 'returnHiddenAttrs': returnHiddenAttrs,
        if (returnCertInfo != null) 'returnCertInfo': returnCertInfo,
        if (wantImapUid != null) 'wantImapUid': wantImapUid,
        if (maxMembers != null) 'maxMembers': maxMembers,
        if (attributes.isNotEmpty) 'a': attributes.map((a) => a.toMap()).toList(),
        if (memberAttributes.isNotEmpty) 'ma': memberAttributes.map((ma) => ma.toMap()).toList(),
        if (contacts.isNotEmpty) 'cn': contacts.map((cn) => cn.toMap()).toList(),
      };
}
