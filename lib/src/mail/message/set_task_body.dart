// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'set_task_request.dart';
import 'set_task_response.dart';

class SetTaskBody extends SoapBody {
  SetTaskBody({SetTaskRequest? request, SetTaskResponse? response})
      : super(request: request, response: response);

  factory SetTaskBody.fromMap(Map<String, dynamic> data) => SetTaskBody(
      response: data['SetTaskResponse'] != null ? SetTaskResponse.fromMap(data['SetTaskResponse']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'SetTaskRequest': request!.toMap(),
      };
}
