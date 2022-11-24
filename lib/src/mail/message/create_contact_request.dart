// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import '../type/contact_spec.dart';
import 'create_contact_body.dart';
import 'create_contact_envelope.dart';

/// Create a contact
class CreateContactRequest extends SoapRequest {
  /// Contact specification
  final ContactSpec contact;

  /// If set (defaults to unset) The returned <cn> is just a placeholder
  /// containing the new contact ID (i.e. <cn id="{id}"/>)
  final bool? verbose;

  /// Set to return IMAP UID. (default is unset.)
  final bool? wantImapUid;

  /// Set to return Modified Sequence. (default is unset.)
  final bool? wantModifiedSequence;

  CreateContactRequest(
    this.contact, {
    this.verbose,
    this.wantImapUid,
    this.wantModifiedSequence,
  });

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      CreateContactEnvelope(CreateContactBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'cn': contact.toMap(),
        if (verbose != null) 'verbose': verbose,
        if (wantImapUid != null) 'wantImapUid': wantImapUid,
        if (wantModifiedSequence != null) 'wantModSeq': wantModifiedSequence,
      };
}
