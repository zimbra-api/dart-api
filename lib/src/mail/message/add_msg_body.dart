// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'add_msg_request.dart';
import 'add_msg_response.dart';

class AddMsgBody extends SoapBody {
  AddMsgBody({AddMsgRequest? request, AddMsgResponse? response, super.fault})
      : super(request: request, response: response);

  factory AddMsgBody.fromJson(Map<String, dynamic> json) => AddMsgBody(
      response: json['AddMsgResponse'] != null ? AddMsgResponse.fromJson(json['AddMsgResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  AddMsgRequest? get addMsgRequest => request as AddMsgRequest?;

  AddMsgResponse? get addMsgResponse => response as AddMsgResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'AddMsgRequest': request!.toJson(),
      };
}
