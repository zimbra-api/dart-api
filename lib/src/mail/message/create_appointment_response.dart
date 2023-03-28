// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/id.dart';
import '../type/cal_echo.dart';
import '../type/create_calendar_item_response.dart';

class CreateAppointmentResponse extends CreateCalendarItemResponse {
  CreateAppointmentResponse({
    super.calItemId,
    super.deprecatedApptId,
    super.calInvId,
    super.modifiedSequence,
    super.revision,
    super.msg,
    super.echo,
  });

  factory CreateAppointmentResponse.fromMap(
    Map<String, dynamic> data,
  ) =>
      CreateAppointmentResponse(
        calItemId: data['calItemId'],
        deprecatedApptId: data['apptId'],
        calInvId: data['invId'],
        modifiedSequence: int.tryParse(data['ms']?.toString() ?? ''),
        revision: int.tryParse(data['rev']?.toString() ?? ''),
        msg: data['m'] is Map ? Id.fromMap(data['m']) : null,
        echo: data['echo'] is Map ? CalEcho.fromMap(data['echo']) : null,
      );
}
