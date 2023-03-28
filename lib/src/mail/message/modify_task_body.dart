// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'modify_task_request.dart';
import 'modify_task_response.dart';

class ModifyTaskBody extends SoapBody {
  ModifyTaskBody({
    ModifyTaskRequest? request,
    ModifyTaskResponse? response,
  }) : super(request: request, response: response);

  factory ModifyTaskBody.fromMap(Map<String, dynamic> data) => ModifyTaskBody(
        response: data['ModifyTaskResponse'] != null
            ? ModifyTaskResponse.fromMap(
                data['ModifyTaskResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'ModifyTaskRequest': request!.toMap(),
      };
}
