// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'add_task_invite_request.dart';
import 'add_task_invite_response.dart';

class AddTaskInviteBody extends SoapBody {
  AddTaskInviteBody({AddTaskInviteRequest? request, AddTaskInviteResponse? response})
      : super(request: request, response: response);

  factory AddTaskInviteBody.fromMap(Map<String, dynamic> data) => AddTaskInviteBody(
      response:
          data['AddTaskInviteResponse'] != null ? AddTaskInviteResponse.fromMap(data['AddTaskInviteResponse']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'AddTaskInviteRequest': request!.toMap(),
      };
}
