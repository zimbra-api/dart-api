// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'bounce_msg_body.dart';

class BounceMsgEnvelope extends SoapEnvelope {
  BounceMsgEnvelope(BounceMsgBody body, {super.header}) : super(body);

  factory BounceMsgEnvelope.fromJson(Map<String, dynamic> json) =>
      BounceMsgEnvelope(BounceMsgBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  BounceMsgBody get bounceMsgBody => body as BounceMsgBody;
}