// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import '../type/save_draft_msg.dart';
import 'save_draft_body.dart';
import 'save_draft_envelope.dart';

/// Save draft
/// - Only allowed one top-level <mp> but can nest <mp>s within if multipart/* on reply/forward.
///   Set origid on <m> element and set rt to "r" or "w", respectively.
/// - Can optionally set identity-id to specify the identity being used to compose the message.  If updating an
///   existing draft, set "id" attr on <m> element.
/// - Can refer to parts of existing draft in <attach> block
/// - Drafts default to the Drafts folder
/// - Setting folder/tags/flags/color occurs after the draft is created/updated, and if it fails the content
///   WILL STILL BE SAVED
/// - Can optionally set autoSendTime to specify the time at which the draft should be automatically sent by the server
/// - The ID of the saved draft is returned in the "id" attribute of the response.
/// - The ID referenced in the response's "idnt" attribute specifies the folder where the sent message is saved.
class SaveDraftRequest extends SoapRequest {
  /// Details of draft to save
  final SaveDraftMsg msg;

  /// Set to return IMAP UID. (default is unset.)
  final bool? wantImapUid;

  /// Set to return Modified Sequence. (default is unset.)
  final bool? wantModifiedSequence;

  SaveDraftRequest(
    this.msg, {
    this.wantImapUid,
    this.wantModifiedSequence,
  });

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => SaveDraftEnvelope(SaveDraftBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'm': msg.toMap(),
        if (wantImapUid != null) 'wantImapUid': wantImapUid,
        if (wantModifiedSequence != null) 'wantModSeq': wantModifiedSequence,
      };
}
