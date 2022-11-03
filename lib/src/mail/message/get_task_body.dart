// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';

import 'get_task_request.dart';
import 'get_task_response.dart';

class GetTaskBody extends SoapBody {
  GetTaskBody({GetTaskRequest? request, GetTaskResponse? response})
      : super(request: request, response: response);

  factory GetTaskBody.fromMap(Map<String, dynamic> data) => GetTaskBody(
      response: data['GetTaskResponse'] != null ? GetTaskResponse.fromMap(data['GetTaskResponse']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetTaskRequest': request!.toMap(),
      };
}
