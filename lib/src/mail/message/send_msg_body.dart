// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'send_msg_request.dart';
import 'send_msg_response.dart';

class SendMsgBody extends SoapBody {
  SendMsgBody({
    SendMsgRequest? request,
    SendMsgResponse? response,
  }) : super(request: request, response: response);

  factory SendMsgBody.fromMap(Map<String, dynamic> data) => SendMsgBody(
        response: data['SendMsgResponse'] != null
            ? SendMsgResponse.fromMap(
                data['SendMsgResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'SendMsgRequest': request!.toMap(),
      };
}
