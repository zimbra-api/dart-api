// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'set_appointment_request.dart';
import 'set_task_body.dart';
import 'set_task_envelope.dart';

/// Directly set status of an entire task.
/// See SetAppointment for more information.
class SetTaskRequest extends SetAppointmentRequest {
  SetTaskRequest(
      {super.flags,
      super.tags,
      super.tagNames,
      super.folderId,
      super.noNextAlarm,
      super.nextAlarm,
      super.defaultId,
      super.exceptions = const [],
      super.cancellations = const [],
      super.replies = const []});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => SetTaskEnvelope(SetTaskBody(request: this), header: header);
}
