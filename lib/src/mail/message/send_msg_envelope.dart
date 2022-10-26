// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'send_msg_body.dart';

class SendMsgEnvelope extends SoapEnvelope {
  SendMsgEnvelope(SendMsgBody body, {super.header}) : super(body);

  factory SendMsgEnvelope.fromJson(Map<String, dynamic> json) => SendMsgEnvelope(SendMsgBody.fromJson(json['Body']),
      header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  SendMsgBody get sendMsgBody => body as SendMsgBody;
}
