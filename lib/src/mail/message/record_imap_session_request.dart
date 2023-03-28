// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import 'record_imap_session_body.dart';
import 'record_imap_session_envelope.dart';

/// Record that an IMAP client has seen all the messages in this folder as they are at this time.
/// This is used to determine which messages are considered by IMAP to be RECENT.
/// This is achieved by invoking Mailbox::recordImapSession for the specified folder
class RecordIMAPSessionRequest extends SoapRequest {
  /// The ID of the folder to record
  final String folderId;

  RecordIMAPSessionRequest(this.folderId);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => RecordIMAPSessionEnvelope(
        RecordIMAPSessionBody(request: this),
        header: header,
      );

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'id': folderId,
      };
}
