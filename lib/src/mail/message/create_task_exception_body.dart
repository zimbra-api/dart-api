// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'create_task_exception_request.dart';
import 'create_task_exception_response.dart';

class CreateTaskExceptionBody extends SoapBody {
  CreateTaskExceptionBody({
    CreateTaskExceptionRequest? request,
    CreateTaskExceptionResponse? response,
  }) : super(request: request, response: response);

  factory CreateTaskExceptionBody.fromMap(
    Map<String, dynamic> data,
  ) =>
      CreateTaskExceptionBody(
        response: data['CreateTaskExceptionResponse'] != null
            ? CreateTaskExceptionResponse.fromMap(
                data['CreateTaskExceptionResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'CreateTaskExceptionRequest': request!.toMap(),
      };
}
