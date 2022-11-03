// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'send_msg_request.dart';
import 'send_msg_response.dart';

class SendMsgBody extends SoapBody {
  SendMsgBody({SendMsgRequest? request, SendMsgResponse? response, super.fault})
      : super(request: request, response: response);

  factory SendMsgBody.fromMap(Map<String, dynamic> data) => SendMsgBody(
      response: data['SendMsgResponse'] != null ? SendMsgResponse.fromMap(data['SendMsgResponse']) : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  SendMsgRequest? get sendMsgRequest => request as SendMsgRequest?;

  SendMsgResponse? get sendMsgResponse => response as SendMsgResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'SendMsgRequest': request!.toMap(),
      };
}
