// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import '../type/msg_spec.dart';
import 'get_msg_body.dart';
import 'get_msg_envelope.dart';

/// Get message
class GetMsgRequest extends SoapRequest {
  /// Message specification
  final MsgSpec msg;

  GetMsgRequest(this.msg);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => GetMsgEnvelope(
        GetMsgBody(request: this),
        header: header,
      );

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'm': msg.toMap(),
      };
}
