// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'cancel_task_request.dart';
import 'cancel_task_response.dart';

class CancelTaskBody extends SoapBody {
  CancelTaskBody({CancelTaskRequest? request, CancelTaskResponse? response, super.fault})
      : super(request: request, response: response);

  factory CancelTaskBody.fromJson(Map<String, dynamic> json) => CancelTaskBody(
      response: json['CancelTaskResponse'] != null ? CancelTaskResponse.fromJson(json['CancelTaskResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  CancelTaskRequest? get cancelTaskRequest => request as CancelTaskRequest?;

  CancelTaskResponse? get cancelTaskResponse => response as CancelTaskResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'CancelTaskRequest': request!.toJson(),
      };
}
