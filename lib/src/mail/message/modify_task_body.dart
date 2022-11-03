// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'modify_task_request.dart';
import 'modify_task_response.dart';

class ModifyTaskBody extends SoapBody {
  ModifyTaskBody({ModifyTaskRequest? request, ModifyTaskResponse? response, super.fault})
      : super(request: request, response: response);

  factory ModifyTaskBody.fromMap(Map<String, dynamic> data) => ModifyTaskBody(
      response: data['ModifyTaskResponse'] != null ? ModifyTaskResponse.fromMap(data['ModifyTaskResponse']) : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  ModifyTaskRequest? get modifyTaskRequest => request as ModifyTaskRequest?;

  ModifyTaskResponse? get modifyTaskResponse => response as ModifyTaskResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'ModifyTaskRequest': request!.toMap(),
      };
}
