// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'bounce_msg_request.dart';
import 'bounce_msg_response.dart';

class BounceMsgBody extends SoapBody {
  BounceMsgBody({BounceMsgRequest? request, BounceMsgResponse? response, super.fault})
      : super(request: request, response: response);

  factory BounceMsgBody.fromMap(Map<String, dynamic> data) => BounceMsgBody(
      response: data['BounceMsgResponse'] != null ? BounceMsgResponse.fromMap(data['BounceMsgResponse']) : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'BounceMsgRequest': request!.toMap(),
      };
}
