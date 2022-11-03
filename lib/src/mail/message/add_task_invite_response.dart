// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'add_appointment_invite_response.dart';

class AddTaskInviteResponse extends AddAppointmentInviteResponse {
  AddTaskInviteResponse({super.calItemId, super.invId, super.componentNum});

  factory AddTaskInviteResponse.fromMap(Map<String, dynamic> data) =>
      AddTaskInviteResponse(calItemId: data['calItemId'], invId: data['invId'], componentNum: data['compNum']);
}
