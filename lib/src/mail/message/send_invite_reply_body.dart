// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'send_invite_reply_request.dart';
import 'send_invite_reply_response.dart';

class SendInviteReplyBody extends SoapBody {
  SendInviteReplyBody({SendInviteReplyRequest? request, SendInviteReplyResponse? response, super.fault})
      : super(request: request, response: response);

  factory SendInviteReplyBody.fromMap(Map<String, dynamic> data) => SendInviteReplyBody(
      response: data['SendInviteReplyResponse'] != null
          ? SendInviteReplyResponse.fromMap(data['SendInviteReplyResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  SendInviteReplyRequest? get sendInviteReplyRequest => request as SendInviteReplyRequest?;

  SendInviteReplyResponse? get sendInviteReplyResponse => response as SendInviteReplyResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'SendInviteReplyRequest': request!.toMap(),
      };
}
