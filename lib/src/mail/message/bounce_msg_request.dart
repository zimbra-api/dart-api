// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';
import 'package:zimbra_api/src/mail/type/bounce_msg_spec.dart';

import 'bounce_msg_body.dart';
import 'bounce_msg_envelope.dart';

/// Resend a message
///
/// Supports (f)rom, (t)o, (c)c, (b)cc, (s)ender "type" on <e> elements
/// (these get mapped to Resent-From, Resent-To, Resent-CC, Resent-Bcc, Resent-Sender headers,
/// which are prepended to copy of existing message)
/// Aside from these prepended headers, message is reinjected verbatim
class BounceMsgRequest extends SoapRequest {
  /// Specification of message to be resent
  final BounceMsgSpec msg;

  BounceMsgRequest(this.msg);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => BounceMsgEnvelope(BounceMsgBody(request: this), header: header);

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraMail',
        'm': msg.toJson(),
      };
}
