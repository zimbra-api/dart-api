// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_task_summaries_request.dart';
import 'get_task_summaries_response.dart';

class GetTaskSummariesBody extends SoapBody {
  GetTaskSummariesBody({GetTaskSummariesRequest? request, GetTaskSummariesResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetTaskSummariesBody.fromJson(Map<String, dynamic> json) => GetTaskSummariesBody(
      response: json['GetTaskSummariesResponse'] != null
          ? GetTaskSummariesResponse.fromJson(json['GetTaskSummariesResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetTaskSummariesRequest? get getTaskSummariesRequest => request as GetTaskSummariesRequest?;

  GetTaskSummariesResponse? get getTaskSummariesResponse => response as GetTaskSummariesResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetTaskSummariesRequest': request!.toJson(),
      };
}