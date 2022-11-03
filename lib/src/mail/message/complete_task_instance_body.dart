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

  factory CompleteTaskInstanceBody.fromMap(Map<String, dynamic> data) => CompleteTaskInstanceBody(
      response: data['CompleteTaskInstanceResponse'] != null
          ? CompleteTaskInstanceResponse.fromMap(data['CompleteTaskInstanceResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  CompleteTaskInstanceRequest? get completeTaskInstanceRequest => request as CompleteTaskInstanceRequest?;

  CompleteTaskInstanceResponse? get completeTaskInstanceResponse => response as CompleteTaskInstanceResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'CompleteTaskInstanceRequest': request!.toMap(),
      };
}
