// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'complete_task_instance_request.dart';
import 'complete_task_instance_response.dart';

class CompleteTaskInstanceBody extends SoapBody {
  CompleteTaskInstanceBody({CompleteTaskInstanceRequest? request, CompleteTaskInstanceResponse? response, super.fault})
      : super(request: request, response: response);

  factory CompleteTaskInstanceBody.fromJson(Map<String, dynamic> json) => CompleteTaskInstanceBody(
      response: json['CompleteTaskInstanceResponse'] != null
          ? CompleteTaskInstanceResponse.fromJson(json['CompleteTaskInstanceResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  CompleteTaskInstanceRequest? get completeTaskInstanceRequest => request as CompleteTaskInstanceRequest?;

  CompleteTaskInstanceResponse? get completeTaskInstanceResponse => response as CompleteTaskInstanceResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'CompleteTaskInstanceRequest': request!.toJson(),
      };
}
