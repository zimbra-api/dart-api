// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'get_task_summaries_request.dart';
import 'get_task_summaries_response.dart';

class GetTaskSummariesBody extends SoapBody {
  GetTaskSummariesBody({
    GetTaskSummariesRequest? request,
    GetTaskSummariesResponse? response,
  }) : super(request: request, response: response);

  factory GetTaskSummariesBody.fromMap(
    Map<String, dynamic> data,
  ) =>
      GetTaskSummariesBody(
        response: data['GetTaskSummariesResponse'] != null
            ? GetTaskSummariesResponse.fromMap(
                data['GetTaskSummariesResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetTaskSummariesRequest': request!.toMap(),
      };
}
