// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'complete_task_instance_request.dart';
import 'complete_task_instance_response.dart';

class CompleteTaskInstanceBody extends SoapBody {
  CompleteTaskInstanceBody({CompleteTaskInstanceRequest? request, CompleteTaskInstanceResponse? response})
      : super(request: request, response: response);

  factory CompleteTaskInstanceBody.fromMap(Map<String, dynamic> data) => CompleteTaskInstanceBody(
      response: data['CompleteTaskInstanceResponse'] != null
          ? CompleteTaskInstanceResponse.fromMap(data['CompleteTaskInstanceResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'CompleteTaskInstanceRequest': request!.toMap(),
      };
}
