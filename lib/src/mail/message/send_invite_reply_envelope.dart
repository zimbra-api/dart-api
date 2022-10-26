// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'send_invite_reply_body.dart';

class SendInviteReplyEnvelope extends SoapEnvelope {
  SendInviteReplyEnvelope(SendInviteReplyBody body, {super.header}) : super(body);

  factory SendInviteReplyEnvelope.fromJson(Map<String, dynamic> json) =>
      SendInviteReplyEnvelope(SendInviteReplyBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  SendInviteReplyBody get sendInviteReplyBody => body as SendInviteReplyBody;
}
