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

  factory BounceMsgBody.fromJson(Map<String, dynamic> json) => BounceMsgBody(
      response: json['BounceMsgResponse'] != null ? BounceMsgResponse.fromJson(json['BounceMsgResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  BounceMsgRequest? get bounceMsgRequest => request as BounceMsgRequest?;

  BounceMsgResponse? get bounceMsgResponse => response as BounceMsgResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'BounceMsgRequest': request!.toJson(),
      };
}
