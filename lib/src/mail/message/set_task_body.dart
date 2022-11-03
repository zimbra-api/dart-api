// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'set_task_request.dart';
import 'set_task_response.dart';

class SetTaskBody extends SoapBody {
  SetTaskBody({SetTaskRequest? request, SetTaskResponse? response, super.fault})
      : super(request: request, response: response);

  factory SetTaskBody.fromMap(Map<String, dynamic> data) => SetTaskBody(
      response: data['SetTaskResponse'] != null ? SetTaskResponse.fromMap(data['SetTaskResponse']) : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  SetTaskRequest? get setTaskRequest => request as SetTaskRequest?;

  SetTaskResponse? get setTaskResponse => response as SetTaskResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'SetTaskRequest': request!.toMap(),
      };
}
