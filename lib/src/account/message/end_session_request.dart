// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'end_session_body.dart';
import 'end_session_envelope.dart';

/// End the current session, removing it from all caches.
/// Called when the browser app (or other session-using app) shuts down.
/// Has no effect if called in a <nosession> context.
class EndSessionRequest extends SoapRequest {
  /// flag whether the {exp} flag is needed in the response for group entries.
  /// default is false
  bool? logoff;

  /// flag to clear all web sessions of the user default is false
  bool? clearAllSoapSessions;

  /// flag to decide current session will be cleared or not default is false
  bool? excludeCurrentSession;

  /// end session for given session id
  String? sessionId;

  EndSessionRequest({this.logoff, this.clearAllSoapSessions, this.excludeCurrentSession, this.sessionId});

  @override
  SoapEnvelope getEnvelope() => EndSessionEnvelope(EndSessionBody(request: this));

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraAccount',
        if (logoff != null) 'logoff': logoff,
        if (clearAllSoapSessions != null) 'all': clearAllSoapSessions,
        if (excludeCurrentSession != null) 'excludeCurrent': excludeCurrentSession,
        if (sessionId != null) 'sessionId': sessionId,
      };
}
