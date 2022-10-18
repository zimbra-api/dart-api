// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'create_task_exception_request.dart';
import 'create_task_exception_response.dart';

class CreateTaskExceptionBody extends SoapBody {
  CreateTaskExceptionBody({CreateTaskExceptionRequest? request, CreateTaskExceptionResponse? response, super.fault})
      : super(request: request, response: response);

  factory CreateTaskExceptionBody.fromJson(Map<String, dynamic> json) => CreateTaskExceptionBody(
      response: json['CreateTaskExceptionResponse'] != null
          ? CreateTaskExceptionResponse.fromJson(json['CreateTaskExceptionResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  CreateTaskExceptionRequest? get createTaskExceptionRequest => request as CreateTaskExceptionRequest?;

  CreateTaskExceptionResponse? get createTaskExceptionResponse => response as CreateTaskExceptionResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'CreateTaskExceptionRequest': request!.toJson(),
      };
}
