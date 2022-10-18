// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'create_task_request.dart';
import 'create_task_response.dart';

class CreateTaskBody extends SoapBody {
  CreateTaskBody({CreateTaskRequest? request, CreateTaskResponse? response, super.fault})
      : super(request: request, response: response);

  factory CreateTaskBody.fromJson(Map<String, dynamic> json) => CreateTaskBody(
      response: json['CreateTaskResponse'] != null ? CreateTaskResponse.fromJson(json['CreateTaskResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  CreateTaskRequest? get createTaskRequest => request as CreateTaskRequest?;

  CreateTaskResponse? get createTaskResponse => response as CreateTaskResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'CreateTaskRequest': request!.toJson(),
      };
}
