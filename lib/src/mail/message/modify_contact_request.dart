// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';
import 'package:zimbra_api/src/mail/type/modify_contact_spec.dart';

import 'modify_contact_body.dart';
import 'modify_contact_envelope.dart';

/// Modify contact
/// When modifying tags, all specified tags are set and all others are unset.
/// If tn="{tag-names}" is NOT specified then any existing tags will remain set.
class ModifyContactRequest extends SoapRequest {
  /// Specification of contact modifications
  final ModifyContactSpec contact;

  /// If set, all attrs and group members in the specified contact are replaced with specified attrs and group members,
  /// otherwise the attrs and group members are merged with the existing contact.
  /// Unset by default.
  final bool? replace;

  /// If unset, the returned <cn> is just a placeholder containing the contact ID
  /// (i.e. <cn id="{id}">). {verbose} is set by default.
  final bool? verbose;

  /// Set to return IMAP UID. (default is unset.)
  final bool? wantImapUid;

  /// Set to return Modified Sequence. (default is unset.)
  final bool? wantModifiedSequence;

  ModifyContactRequest(this.contact, {this.replace, this.verbose, this.wantImapUid, this.wantModifiedSequence});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      ModifyContactEnvelope(ModifyContactBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'cn': contact.toMap(),
        if (replace != null) 'replace': replace,
        if (verbose != null) 'verbose': verbose,
        if (wantImapUid != null) 'wantImapUid': wantImapUid,
        if (wantModifiedSequence != null) 'wantModSeq': wantModifiedSequence,
      };
}
