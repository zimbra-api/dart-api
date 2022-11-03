// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'msg_action_request.dart';
import 'msg_action_response.dart';

class MsgActionBody extends SoapBody {
  MsgActionBody({MsgActionRequest? request, MsgActionResponse? response, super.fault})
      : super(request: request, response: response);

  factory MsgActionBody.fromMap(Map<String, dynamic> data) => MsgActionBody(
      response: data['MsgActionResponse'] != null ? MsgActionResponse.fromMap(data['MsgActionResponse']) : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  MsgActionRequest? get msgActionRequest => request as MsgActionRequest?;

  MsgActionResponse? get msgActionResponse => response as MsgActionResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'MsgActionRequest': request!.toMap(),
      };
}
