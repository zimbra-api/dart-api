// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';

import 'cancel_task_request.dart';
import 'cancel_task_response.dart';

class CancelTaskBody extends SoapBody {
  CancelTaskBody({CancelTaskRequest? request, CancelTaskResponse? response})
      : super(request: request, response: response);

  factory CancelTaskBody.fromMap(Map<String, dynamic> data) => CancelTaskBody(
      response: data['CancelTaskResponse'] != null ? CancelTaskResponse.fromMap(data['CancelTaskResponse']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'CancelTaskRequest': request!.toMap(),
      };
}
