// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_task_request.dart';
import 'get_task_response.dart';

class GetTaskBody extends SoapBody {
  GetTaskBody({GetTaskRequest? request, GetTaskResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetTaskBody.fromJson(Map<String, dynamic> json) => GetTaskBody(
      response: json['GetTaskResponse'] != null ? GetTaskResponse.fromJson(json['GetTaskResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetTaskRequest? get getTaskRequest => request as GetTaskRequest?;

  GetTaskResponse? get getTaskResponse => response as GetTaskResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetTaskRequest': request!.toJson(),
      };
}
