// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/id.dart';
import 'package:zimbra_api/src/mail/type/cal_echo.dart';
import 'package:zimbra_api/src/mail/type/create_calendar_item_response.dart';

/// Contains response information for modify appointment
class ModifyAppointmentResponse extends CreateCalendarItemResponse {
  ModifyAppointmentResponse(
      {super.calItemId,
      super.deprecatedApptId,
      super.calInvId,
      super.modifiedSequence,
      super.revision,
      super.msg,
      super.echo});

  factory ModifyAppointmentResponse.fromMap(Map<String, dynamic> data) => ModifyAppointmentResponse(
      calItemId: data['calItemId'],
      deprecatedApptId: data['apptId'],
      calInvId: data['invId'],
      modifiedSequence: data['ms'],
      revision: data['rev'],
      msg: data['m'] is Map ? Id.fromMap(data['m']) : null,
      echo: data['echo'] is Map ? CalEcho.fromMap(data['echo']) : null);
}
