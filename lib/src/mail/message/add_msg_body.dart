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

  factory AddMsgBody.fromMap(Map<String, dynamic> data) => AddMsgBody(
      response: data['AddMsgResponse'] != null ? AddMsgResponse.fromMap(data['AddMsgResponse']) : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  AddMsgRequest? get addMsgRequest => request as AddMsgRequest?;

  AddMsgResponse? get addMsgResponse => response as AddMsgResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'AddMsgRequest': request!.toMap(),
      };
}
