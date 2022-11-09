// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/id.dart';
import 'package:zimbra_api/src/mail/type/cal_echo.dart';

import 'modify_appointment_response.dart';

/// Contains response information for modify task
class ModifyTaskResponse extends ModifyAppointmentResponse {
  ModifyTaskResponse(
      {super.calItemId,
      super.deprecatedApptId,
      super.calInvId,
      super.modifiedSequence,
      super.revision,
      super.msg,
      super.echo});

  factory ModifyTaskResponse.fromMap(Map<String, dynamic> data) => ModifyTaskResponse(
      calItemId: data['calItemId'],
      deprecatedApptId: data['apptId'],
      calInvId: data['invId'],
      modifiedSequence: int.tryParse(data['ms']?.toString() ?? ''),
      revision: int.tryParse(data['rev']?.toString() ?? ''),
      msg: data['m'] is Map ? Id.fromMap(data['m']) : null,
      echo: data['echo'] is Map ? CalEcho.fromMap(data['echo']) : null);
}
