// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_header.dart';
import '../../common/type/soap_request.dart';
import 'end_session_body.dart';
import 'end_session_envelope.dart';

/// End the current session, removing it from all caches.
/// Called when the browser app (or other session-using app) shuts down.
/// Has no effect if called in a <nosession> context.
class EndSessionRequest extends SoapRequest {
  /// flag whether the {exp} flag is needed in the response for group entries.
  /// default is false
  final bool? logoff;

  /// flag to clear all web sessions of the user default is false
  final bool? clearAllSoapSessions;

  /// flag to decide current session will be cleared or not default is false
  final bool? excludeCurrentSession;

  /// end session for given session id
  final String? sessionId;

  EndSessionRequest({
    this.logoff,
    this.clearAllSoapSessions,
    this.excludeCurrentSession,
    this.sessionId,
  });

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => EndSessionEnvelope(EndSessionBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraAccount',
        if (logoff != null) 'logoff': logoff,
        if (clearAllSoapSessions != null) 'all': clearAllSoapSessions,
        if (excludeCurrentSession != null) 'excludeCurrent': excludeCurrentSession,
        if (sessionId != null) 'sessionId': sessionId,
      };
}
