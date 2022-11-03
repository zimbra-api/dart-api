// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'add_task_invite_request.dart';
import 'add_task_invite_response.dart';

class AddTaskInviteBody extends SoapBody {
  AddTaskInviteBody({AddTaskInviteRequest? request, AddTaskInviteResponse? response, super.fault})
      : super(request: request, response: response);

  factory AddTaskInviteBody.fromMap(Map<String, dynamic> data) => AddTaskInviteBody(
      response:
          data['AddTaskInviteResponse'] != null ? AddTaskInviteResponse.fromMap(data['AddTaskInviteResponse']) : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  AddTaskInviteRequest? get addTaskInviteRequest => request as AddTaskInviteRequest?;

  AddTaskInviteResponse? get addTaskInviteResponse => response as AddTaskInviteResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'AddTaskInviteRequest': request!.toMap(),
      };
}
