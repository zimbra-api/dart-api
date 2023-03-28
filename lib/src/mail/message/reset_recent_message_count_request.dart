// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import 'reset_recent_message_count_body.dart';
import 'reset_recent_message_count_envelope.dart';

/// Resets the mailbox's "recent message count" to 0.
/// A message is considered "recent" if:
/// - (a) it's not a draft or a sent message, and
/// - (b) it was added since the last write operation associated with any SOAP session.
class ResetRecentMessageCountRequest extends SoapRequest {
  @override
  SoapEnvelope getEnvelope({
    SoapHeader? header,
  }) =>
      ResetRecentMessageCountEnvelope(
        ResetRecentMessageCountBody(request: this),
        header: header,
      );

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
      };
}
