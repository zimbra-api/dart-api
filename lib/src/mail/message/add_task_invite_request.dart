// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_header.dart';
import 'add_appointment_invite_request.dart';
import 'add_task_invite_body.dart';
import 'add_task_invite_envelope.dart';

/// Add a task invite
class AddTaskInviteRequest extends AddAppointmentInviteRequest {
  AddTaskInviteRequest(super.msg, {super.partStat});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      AddTaskInviteEnvelope(AddTaskInviteBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        if (partStat != null) 'ptst': partStat!.name,
        'm': msg.toMap(),
      };
}
